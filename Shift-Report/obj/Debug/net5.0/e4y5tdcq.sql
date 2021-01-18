IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Agent] (
    [Id] int NOT NULL IDENTITY,
    [BadgeNo] int NOT NULL,
    [Name] nvarchar(max) NULL,
    [UserId] nvarchar(max) NULL,
    CONSTRAINT [PK_Agent] PRIMARY KEY ([Id])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210116163016_replaceAgentId', N'5.0.2');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Agent] ADD [AspNetUsersId] nvarchar(450) NULL;
GO

CREATE INDEX [IX_Agent_AspNetUsersId] ON [Agent] ([AspNetUsersId]);
GO

ALTER TABLE [Agent] ADD CONSTRAINT [FK_Agent_AspNetUsers_AspNetUsersId] FOREIGN KEY ([AspNetUsersId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210116163631_relationWithIdentity', N'5.0.2');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Agent] DROP CONSTRAINT [FK_Agent_AspNetUsers_AspNetUsersId];
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Agent]') AND [c].[name] = N'UserId');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Agent] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Agent] DROP COLUMN [UserId];
GO

EXEC sp_rename N'[Agent].[AspNetUsersId]', N'IdentityUserId', N'COLUMN';
GO

EXEC sp_rename N'[Agent].[IX_Agent_AspNetUsersId]', N'IX_Agent_IdentityUserId', N'INDEX';
GO

ALTER TABLE [Agent] ADD CONSTRAINT [FK_Agent_AspNetUsers_IdentityUserId] FOREIGN KEY ([IdentityUserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210116164009_relationWithIdentities', N'5.0.2');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210116164917_identityDbContext', N'5.0.2');
GO

COMMIT;
GO

