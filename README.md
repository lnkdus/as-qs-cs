# Quick Start

Azure App Service Quick Start using C# and dotnet core

Open Codespaces - link

Create a new codespace

Specify this repo as the source - lnkdus/as-qs-cs

Click create

Once connected

- make sure the codespaces initialization is complete
- open a bash shell (terminal)

```bash

mkdir -p QuickStart
cd QuickStart

# Create a C# Web API sample
dotnet new webapi --auth non --no-https

```

- Open QuickStart/Program.cs in the Visual Studio Code file explorer on the left
- Add the following line of code just before `webBuilder.UseStartup ...`
  - `webBuilder.UseUrls("http://*:5000");`

Pres F5 to run the application locally

