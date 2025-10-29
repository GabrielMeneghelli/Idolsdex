using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BallonDor.Models
{
    [Table("JogadorClube")]
    public class JogadorClube
    {
        [Key, Column(Order = 0)]
        public uint JogadorId { get; set; }
        [ForeignKey("JogadorId")]
        public Jogador Jogador { get; set; } = null!;

        [Key, Column(Order = 1)]
        public uint ClubeId { get; set; }
        [ForeignKey("ClubeId")]
        public Clube Clube { get; set; } = null!;

        public ushort? AnoInicio { get; set; }
        public ushort? AnoFim { get; set; }
    }
}
