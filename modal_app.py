import modal

app = modal.App("cliproxyapi")

# 镜像
image = modal.Image.from_dockerfile(
    "./Dockerfile",
    force_build=True,
    build_args={"PULL_LATEST": "true"},
)

@app.function(
    image=image,
    secrets=[modal.Secret.from_name("r2-secret")],
    min_containers=0,
    max_containers=1,
    scaledown_window=3600,
)
@modal.concurrent(max_inputs=100)
@modal.web_server(8317, startup_timeout=120)
def run_cliproxy():
    import subprocess
    
    subprocess.Popen(["./CLIProxyAPI"])
