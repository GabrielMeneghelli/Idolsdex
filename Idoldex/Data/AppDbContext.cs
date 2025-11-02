using Microsoft.EntityFrameworkCore;
using BallonDor.Models;

namespace BallonDor.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> opt) : base(opt)
        {
        }

        public DbSet<Nacionalidade> Nacionalidades { get; set; }
        public DbSet<Posicao> Posicoes { get; set; }
        public DbSet<Clube> Clubes { get; set; }
        public DbSet<Jogador> Jogadores { get; set; }
        public DbSet<JogadorClube> JogadoresClubes { get; set; }
        public DbSet<Premio> Premios { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Chave composta da tabela intermediária JogadorClube
            modelBuilder.Entity<JogadorClube>()
                .HasKey(jc => new { jc.Id });

            // Relacionamento 1:N - Jogador → Premios
            modelBuilder.Entity<Premio>()
                .HasOne(p => p.Jogador)
                .WithMany(j => j.Premios)
                .HasForeignKey(p => p.JogadorId)
                .OnDelete(DeleteBehavior.Cascade);

            // Relacionamento N:N - Jogador ↔ Clube
            modelBuilder.Entity<JogadorClube>()
                .HasOne(jc => jc.Jogador)
                .WithMany(j => j.JogadoresClubes)
                .HasForeignKey(jc => jc.JogadorId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<JogadorClube>()
                .HasOne(jc => jc.Clube)
                .WithMany(c => c.JogadoresClubes)
                .HasForeignKey(jc => jc.ClubeId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
