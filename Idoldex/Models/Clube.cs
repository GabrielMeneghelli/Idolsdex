using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BallonDor.Models
{
    [Table("Clube")]
    public class Clube
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public uint Id { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Informe o nome do clube")]
        public string Nome { get; set; } = string.Empty;

        [StringLength(200)]
        public string Imagem { get; set; }

        [StringLength(10)]
        public string Cor { get; set; }

        // Relação N:N com Jogadores
        public List<JogadorClube> JogadoresClubes { get; set; } = new();
    }
}
