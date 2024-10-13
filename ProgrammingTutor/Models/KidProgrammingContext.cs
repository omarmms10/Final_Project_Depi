using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.IO;

namespace ProgrammingTutor.Models
{
    public partial class KidProgrammingContext : IdentityDbContext<IdentityUser>
    {
        public KidProgrammingContext()
        {
        }

        public KidProgrammingContext(DbContextOptions<KidProgrammingContext> options)
            : base(options)
        {
        }

        // Custom tables
        public virtual DbSet<Achievement> Achievements { get; set; }
        public virtual DbSet<Feedback> Feedbacks { get; set; }
        public virtual DbSet<Progress> Progresses { get; set; }
        public virtual DbSet<Tutorial> Tutorials { get; set; }
        public virtual DbSet<TutorialContent> TutorialContents { get; set; }
        public virtual DbSet<UserAchievement> UserAchievements { get; set; }

        // Configure the connection string
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var configuration = new ConfigurationBuilder()
                    .SetBasePath(Directory.GetCurrentDirectory())
                    .AddJsonFile("appsettings.json")
                    .Build();

                optionsBuilder.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            }
        }

        // Configure your custom models
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder); // Ensure Identity tables are created

            // Feedback table
            modelBuilder.Entity<Feedback>(entity =>
            {
                entity.HasKey(e => e.FeedbackId);
                entity.ToTable("Feedback");
                entity.Property(e => e.FeedbackId).HasColumnName("FeedbackID");
                entity.Property(e => e.SubmittedDate)
                      .HasDefaultValueSql("(getdate())")
                      .HasColumnType("datetime");
                entity.Property(e => e.TutorialId).HasColumnName("TutorialID");
                entity.Property(e => e.UserId)
                      .HasColumnName("UserId")
                      .HasColumnType("nvarchar(450)")
                      .IsRequired();

                entity.HasOne(d => d.Tutorial)
                      .WithMany(p => p.Feedbacks)
                      .HasForeignKey(d => d.TutorialId)
                      .OnDelete(DeleteBehavior.Cascade);

                // Explicitly link Feedback.UserId to IdentityUser
                entity.HasOne(d => d.User)  // Now linking to the navigation property
                      .WithMany()
                      .HasForeignKey(d => d.UserId)
                      .OnDelete(DeleteBehavior.Cascade);
            });

            // Progress table
            modelBuilder.Entity<Progress>(entity =>
            {
                entity.HasKey(e => e.ProgressId);
                entity.ToTable("Progress");
                entity.Property(e => e.ProgressId).HasColumnName("ProgressID");

                entity.Property(e => e.UserId)
                      .HasColumnName("UserId")
                      .HasColumnType("nvarchar(450)")
                      .IsRequired();

                entity.Property(e => e.Completed).HasDefaultValue(false);
                entity.Property(e => e.CompletedDate).HasColumnType("datetime");
                entity.Property(e => e.StartedDate)
                      .HasDefaultValueSql("(getdate())")
                      .HasColumnType("datetime");
                entity.Property(e => e.TutorialId).HasColumnName("TutorialID");

                entity.HasOne(d => d.Tutorial)
                      .WithMany(p => p.Progresses)
                      .HasForeignKey(d => d.TutorialId)
                      .OnDelete(DeleteBehavior.Cascade);

                // Explicitly link Progress.UserId to IdentityUser
                entity.HasOne(d => d.User)  // Now linking to the navigation property
                      .WithMany()
                      .HasForeignKey(d => d.UserId)
                      .OnDelete(DeleteBehavior.Cascade);
            });

            // UserAchievement table
            modelBuilder.Entity<UserAchievement>(entity =>
            {
                entity.HasKey(e => e.UserAchievementId);
                entity.Property(e => e.UserAchievementId).HasColumnName("UserAchievementID");
                entity.Property(e => e.AchievementId).HasColumnName("AchievementID");
                entity.Property(e => e.EarnedDate)
                      .HasDefaultValueSql("(getdate())")
                      .HasColumnType("datetime");
                entity.Property(e => e.UserId)
                      .HasColumnName("UserId")
                      .HasColumnType("nvarchar(450)")
                      .IsRequired();

                entity.HasOne(d => d.Achievement)
                      .WithMany(p => p.UserAchievements)
                      .HasForeignKey(d => d.AchievementId)
                      .OnDelete(DeleteBehavior.Cascade);

                // Explicitly link UserAchievement.UserId to IdentityUser
                entity.HasOne(d => d.User)  // Now linking to the navigation property
                      .WithMany()
                      .HasForeignKey(d => d.UserId)
                      .OnDelete(DeleteBehavior.Cascade);
            });

            // Achievement table
            modelBuilder.Entity<Achievement>(entity =>
            {
                entity.HasKey(e => e.AchievementId);
                entity.Property(e => e.AchievementId).HasColumnName("AchievementID");
                entity.Property(e => e.CreatedDate)
                      .HasDefaultValueSql("(getdate())")
                      .HasColumnType("datetime");
                entity.Property(e => e.Title).HasMaxLength(255);
            });

            // TutorialContent table
            modelBuilder.Entity<TutorialContent>(entity =>
            {
                entity.HasKey(e => e.ContentId);
                entity.ToTable("TutorialContent");
                entity.Property(e => e.ContentId).HasColumnName("ContentID");
                entity.Property(e => e.MediaUrl)
                      .HasMaxLength(255)
                      .HasColumnName("MediaURL");
                entity.Property(e => e.TutorialId).HasColumnName("TutorialID");

                entity.HasOne(d => d.Tutorial)
                      .WithMany(p => p.TutorialContents)
                      .HasForeignKey(d => d.TutorialId)
                      .OnDelete(DeleteBehavior.Cascade);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
