using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ProgrammingTutor.Models;

public partial class KidProgrammingContext : DbContext
{
    public KidProgrammingContext()
    {
    }

    public KidProgrammingContext(DbContextOptions<KidProgrammingContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Achievement> Achievements { get; set; }

    public virtual DbSet<Feedback> Feedbacks { get; set; }

    public virtual DbSet<Progress> Progresses { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Tutorial> Tutorials { get; set; }

    public virtual DbSet<TutorialContent> TutorialContents { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserAchievement> UserAchievements { get; set; }

    public virtual DbSet<UserRole> UserRoles { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.;Database=KidProgrammingDB;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Achievement>(entity =>
        {
            entity.HasKey(e => e.AchievementId).HasName("PK__Achievem__276330E0AF62109B");

            entity.Property(e => e.AchievementId).HasColumnName("AchievementID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Title).HasMaxLength(255);
        });

        modelBuilder.Entity<Feedback>(entity =>
        {
            entity.HasKey(e => e.FeedbackId).HasName("PK__Feedback__6A4BEDF67BD7FBBC");

            entity.ToTable("Feedback");

            entity.Property(e => e.FeedbackId).HasColumnName("FeedbackID");
            entity.Property(e => e.SubmittedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.TutorialId).HasColumnName("TutorialID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Tutorial).WithMany(p => p.Feedbacks)
                .HasForeignKey(d => d.TutorialId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Feedback__Tutori__4316F928");

            entity.HasOne(d => d.User).WithMany(p => p.Feedbacks)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Feedback__UserID__4222D4EF");
        });

        modelBuilder.Entity<Progress>(entity =>
        {
            entity.HasKey(e => e.ProgressId).HasName("PK__Progress__BAE29C85282B06E5");

            entity.ToTable("Progress");

            entity.Property(e => e.ProgressId).HasColumnName("ProgressID");
            entity.Property(e => e.Completed).HasDefaultValue(false);
            entity.Property(e => e.CompletedDate).HasColumnType("datetime");
            entity.Property(e => e.StartedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.TutorialId).HasColumnName("TutorialID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Tutorial).WithMany(p => p.Progresses)
                .HasForeignKey(d => d.TutorialId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Progress__Tutori__35BCFE0A");

            entity.HasOne(d => d.User).WithMany(p => p.Progresses)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Progress__UserID__34C8D9D1");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("PK__Roles__8AFACE3A7762BCE8");

            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.RoleName).HasMaxLength(100);
        });

        modelBuilder.Entity<Tutorial>(entity =>
        {
            entity.HasKey(e => e.TutorialId).HasName("PK__Tutorial__5EBC666244AA75ED");

            entity.Property(e => e.TutorialId).HasColumnName("TutorialID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.IsActive).HasDefaultValue(true);
            entity.Property(e => e.Level).HasMaxLength(50);
            entity.Property(e => e.Title).HasMaxLength(255);
        });

        modelBuilder.Entity<TutorialContent>(entity =>
        {
            entity.HasKey(e => e.ContentId).HasName("PK__Tutorial__2907A87ED6A8E9CF");

            entity.ToTable("TutorialContent");

            entity.Property(e => e.ContentId).HasColumnName("ContentID");
            entity.Property(e => e.MediaUrl)
                .HasMaxLength(255)
                .HasColumnName("MediaURL");
            entity.Property(e => e.TutorialId).HasColumnName("TutorialID");

            entity.HasOne(d => d.Tutorial).WithMany(p => p.TutorialContents)
                .HasForeignKey(d => d.TutorialId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__TutorialC__Tutor__31EC6D26");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CCACA56FB7D3");

            entity.HasIndex(e => e.Email, "UQ__Users__A9D10534FEDC14F6").IsUnique();

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.DateJoined)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Email).HasMaxLength(255);
            entity.Property(e => e.IsActive).HasDefaultValue(true);
            entity.Property(e => e.PasswordHash).HasMaxLength(255);
            entity.Property(e => e.Username).HasMaxLength(100);
        });

        modelBuilder.Entity<UserAchievement>(entity =>
        {
            entity.HasKey(e => e.UserAchievementId).HasName("PK__UserAchi__07E627D6885F3E0D");

            entity.Property(e => e.UserAchievementId).HasColumnName("UserAchievementID");
            entity.Property(e => e.AchievementId).HasColumnName("AchievementID");
            entity.Property(e => e.EarnedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Achievement).WithMany(p => p.UserAchievements)
                .HasForeignKey(d => d.AchievementId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__UserAchie__Achie__3E52440B");

            entity.HasOne(d => d.User).WithMany(p => p.UserAchievements)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__UserAchie__UserI__3D5E1FD2");
        });

        modelBuilder.Entity<UserRole>(entity =>
        {
            entity.HasKey(e => e.UserRoleId).HasName("PK__UserRole__3D978A5571E5046C");

            entity.Property(e => e.UserRoleId).HasColumnName("UserRoleID");
            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Role).WithMany(p => p.UserRoles)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__UserRoles__RoleI__2B3F6F97");

            entity.HasOne(d => d.User).WithMany(p => p.UserRoles)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__UserRoles__UserI__2A4B4B5E");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
