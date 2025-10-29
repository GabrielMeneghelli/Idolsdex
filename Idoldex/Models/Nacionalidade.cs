using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BallonDor.Models
{
    [Table("Nacionalidade")]
    public class Nacionalidade
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public uint Id { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Informe o nome da nacionalidade")]
        public string Nome { get; set; } = string.Empty;

        // Relação 1:N com Jogadores
        public List<Jogador> Jogadores { get; set; } = new();
    }
}
