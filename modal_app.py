import modal

app = modal.App("cliproxyapi")

# 镜像
image = modal.Image.from_dockerfile(
    "./Dockerfile",
    force_build=True
)

@app.function(
    image=image,
    secrets=[modal.Secret.from_name("r2-secret")],
    min_containers=0,
    max_containers=1,
    max_inputs=1000,
    scaledown_window=3600,
)
@modal.web_server(8317, startup_timeout=120)
def run_cliproxy():
    import subprocess
    
    subprocess.execv("/CLIProxyAPI", ["/CLIProxyAPI"])
