import modal

app = modal.App("cliproxyapi")

# 镜像
image = modal.Image.from_registry(
    "eceasy/cli-proxy-api:latest",
    force_build=True,
    add_python="3.11"
)

@app.function(
    image=image,
    secrets=[modal.Secret.from_name("r2-secret")]
)
@modal.web_server(8317, startup_timeout=60)  # 这里定义端口即可！
def run_cliproxy():
    import subprocess
    subprocess.run(
        ["./CLIProxyAPI"],
        shell=True,
    )
