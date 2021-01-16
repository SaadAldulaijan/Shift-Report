using Microsoft.EntityFrameworkCore.Migrations;

namespace Shift_Report.Migrations
{
    public partial class relationWithIdentities : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Agent_AspNetUsers_AspNetUsersId",
                table: "Agent");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Agent");

            migrationBuilder.RenameColumn(
                name: "AspNetUsersId",
                table: "Agent",
                newName: "IdentityUserId");

            migrationBuilder.RenameIndex(
                name: "IX_Agent_AspNetUsersId",
                table: "Agent",
                newName: "IX_Agent_IdentityUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Agent_AspNetUsers_IdentityUserId",
                table: "Agent",
                column: "IdentityUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Agent_AspNetUsers_IdentityUserId",
                table: "Agent");

            migrationBuilder.RenameColumn(
                name: "IdentityUserId",
                table: "Agent",
                newName: "AspNetUsersId");

            migrationBuilder.RenameIndex(
                name: "IX_Agent_IdentityUserId",
                table: "Agent",
                newName: "IX_Agent_AspNetUsersId");

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Agent",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Agent_AspNetUsers_AspNetUsersId",
                table: "Agent",
                column: "AspNetUsersId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
