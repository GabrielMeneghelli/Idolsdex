using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BallonDor.Models
{
    [Table("Premio")]
    public class Premio
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public uint Id { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Informe o nome do prêmio")]
        public string Nome { get; set; } = string.Empty;

        [Required]
        public ushort Ano { get; set; }

        [Required]
        public uint JogadorId { get; set; }
        [ForeignKey("JogadorId")]
        public Jogador Jogador { get; set; } = null!;
    }
}
