# hello-aniket — .NET 8

```bash
dotnet run                                         # http://localhost:5000
dotnet build                                       # → bin/Release/net8.0/
dotnet publish -c Release -o publish               # ← artifact = ./publish/
docker build -t hello-aniket-dotnet . && \
  docker run --rm -p 5000:5000 hello-aniket-dotnet
```

### `dotnet build` vs `dotnet publish`
| Command            | Output                                 | Used for                |
|--------------------|----------------------------------------|-------------------------|
| `dotnet build`     | `bin/<cfg>/net8.0/`                    | Local development / tests |
| `dotnet publish`   | `bin/<cfg>/net8.0/publish/`            | **Deployment artifact**   |
| `dotnet pack`      | `bin/<cfg>/*.nupkg`                    | NuGet feed publication    |

Only `publish` produces a self-contained, deployable folder including the
`.dll`, runtime config (`*.runtimeconfig.json`), and any referenced packages.
