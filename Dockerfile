# ---- Stage 1: Build ----
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY *.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o /publish --no-restore

# ---- Stage 2: Runtime ----
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /publish .

# Non-root
RUN groupadd -r app && useradd -r -g app app && chown -R app /app
USER app

EXPOSE 5000
ENV PORT=5000 \
    ASPNETCORE_URLS=http://+:5000

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD curl -fsS http://localhost:5000/health || exit 1

ENTRYPOINT ["dotnet", "hello-aniket.dll"]
