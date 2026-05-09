var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/",       () => Results.Text("Hello Aniket, running in DotNet\n"));
app.MapGet("/health", () => Results.Json(new { status = "UP" }));

var port = Environment.GetEnvironmentVariable("PORT") ?? "5000";
app.Run($"http://0.0.0.0:{port}");
