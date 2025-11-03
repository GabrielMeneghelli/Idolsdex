using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BallonDor.Data;
using BallonDor.Models;
using BallonDor.ViewModels;

namespace BallonDor.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly AppDbContext _db;

    public HomeController(
        ILogger<HomeController> logger,
        AppDbContext db
    )
    {
        _logger = logger;
        _db = db;
    }

    // Página inicial: lista todos os jogadores com suas relações principais
    public IActionResult Index()
    {
        var jogadores = _db.Jogadores
            .Include(j => j.Nacionalidade)
            .Include(j => j.Posicao)
            .Include(j => j.JogadoresClubes)
                .ThenInclude(jc => jc.Clube)
            .ToList();

        return View(jogadores);
    }

    // Detalhes de um jogador específico
    public IActionResult Details(int id)
    {
        var jogador = _db.Jogadores
            .Where(j => j.Id == id)
            .Include(j => j.Nacionalidade)
            .Include(j => j.Posicao)
            .Include(j => j.JogadoresClubes)
                .ThenInclude(jc => jc.Clube)
            .Include(j => j.Premios)
            .SingleOrDefault();

        if (jogador == null)
        {
            return NotFound();
        }

        var premiosAgrupados = jogador.Premios
        .GroupBy(p => p.Nome)
        .Select(g => new PremioAgrupadoVM
        {
            Nome = g.Key,
            Total = g.Count(),
            Anos = string.Join(", ", g.OrderBy(p => p.Ano).Select(p => p.Ano))
        })
        .ToList();

        DetailsVM details = new()
        {
            Atual = jogador,
            Anterior = _db.Jogadores
                .OrderByDescending(j => j.Id)
                .FirstOrDefault(j => j.Id < id),
            Proximo = _db.Jogadores
                .OrderBy(j => j.Id)
                .FirstOrDefault(j => j.Id > id),
            PremiosAgrupados = premiosAgrupados 
        };

        return View(details);
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
