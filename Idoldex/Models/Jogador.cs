using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BallonDor.Models
{
    [Table("Jogador")]
    public class Jogador
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public uint Id { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Informe o nome do jogador")]
        public string Nome { get; set; } = string.Empty;

        [Required]
        public uint NacionalidadeId { get; set; }
        [ForeignKey("NacionalidadeId")]
        public Nacionalidade Nacionalidade { get; set; } = null!;

        [Required]
        public uint PosicaoId { get; set; }
        [ForeignKey("PosicaoId")]
        public Posicao Posicao { get; set; } = null!;

        [Column(TypeName = "double(4,2)")]
        public double Altura { get; set; } = 0;

        [StringLength(200)]
        public string Imagem { get; set; }

        public string Descricao { get; set; }

        // Relação N:N com Clubes
        public List<JogadorClube> JogadoresClubes { get; set; } = new();

        // Relação 1:N com Prêmios
        public List<Premio> Premios { get; set; } = new();
    }
}
