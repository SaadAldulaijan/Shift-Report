using Microsoft.EntityFrameworkCore.Migrations;

namespace Shift_Report.Migrations
{
    public partial class relationWithIdentity : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "AspNetUsersId",
                table: "Agent",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Agent_AspNetUsersId",
                table: "Agent",
                column: "AspNetUsersId");

            migrationBuilder.AddForeignKey(
                name: "FK_Agent_AspNetUsers_AspNetUsersId",
                table: "Agent",
                column: "AspNetUsersId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Agent_AspNetUsers_AspNetUsersId",
                table: "Agent");

            migrationBuilder.DropIndex(
                name: "IX_Agent_AspNetUsersId",
                table: "Agent");

            migrationBuilder.DropColumn(
                name: "AspNetUsersId",
                table: "Agent");
        }
    }
}
