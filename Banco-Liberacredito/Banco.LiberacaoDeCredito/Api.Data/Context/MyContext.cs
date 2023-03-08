
using Banco.LiberacaoDeCredito.Api.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Banco.LiberacaoDeCredito.Api.Data.Context
{
    public partial class MyContext : DbContext
    {
        public MyContext()
        {
        }

        public MyContext(DbContextOptions<MyContext> options) : base(options)
        {
        }

        public virtual DbSet<Cliente> Clientes { get; set; } = null!;

        public virtual DbSet<Financiamento> Financiamentos { get; set; } = null!;

        public virtual DbSet<TipoDoFinanciamento> TipoDoFinanciamentos { get; set; } = null!;

        public virtual DbSet<Parcela> Parcelas { get; set; } = null!;        

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cliente>(entity =>
            {
                entity.ToTable("Cliente");

                entity.Property(e => e.Nome)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Cpf)
                    .HasMaxLength(11)
                    .IsUnicode(false);

                entity.Property(e => e.Uf)
                    .HasMaxLength(2)
                    .IsUnicode(false);

                entity.Property(e => e.Celular)
                    .HasMaxLength(11)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Financiamento>(entity =>
            {
                entity.ToTable("Financiamento");

                entity.HasOne(i => i._Cliente_Id)
                .WithMany(c => c.Financiamentos)
                .HasForeignKey(i => i.Cliente_id)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_Cliente_id");

                entity.Property(e => e.Cpf)
                    .HasMaxLength(11)
                    .IsUnicode(false);

                entity.HasOne(i => i._TipoDoFinanciamento)
                .WithMany(c => c.Financiamentos)
                .HasForeignKey(i => i.Tipo_Financiamento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_Tipo_Financiamento");

                entity.Property(e => e.Valor_total).HasColumnType("decimal(18,0)");

                entity.Property(e => e.Data_Vencimento).HasColumnType("datetime");
            });

            modelBuilder.Entity<Parcela>(entity =>
            {
                entity.ToTable("Parcela");

                entity.HasOne(i => i._FinanciamentoId)
                .WithMany(c => c.Parcelas)
                .HasForeignKey(i => i.Id_Financiamento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_Id_Financiamento");

                entity.Property(e => e.Id_Cliente).HasColumnType("int");

                entity.Property(e => e.Valor_Parcela).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.Data_Vencimento).HasColumnType("datetime");

                entity.Property(e => e.Data_Pagamento).HasColumnType("datetime");

            });

            modelBuilder.Entity<TipoDoFinanciamento>(entity =>
            {
                entity.ToTable("TipoDoFinanciamento");

                entity.Property(e => e.Nome)
                .HasMaxLength(255)
                .IsUnicode(false);

                entity.Property(e => e.Juros).HasColumnType("decimal(18,0");

            });

            OnModelCreatingPartial(modelBuilder);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=(LocalDb)\\MSSQLLocalDB;Database=Banco;Trusted_Connection=True;MultipleActiveResultSets=true");
            }
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

        
    }

}

