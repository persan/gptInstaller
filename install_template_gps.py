import GPS
import install_template
from gps_utils import *


def project_contains_gpt(f):
    for f in GPS.Project.root().languages():
        if f.lower() == "gpt":
            return True
    return False


@interactive("Editor",
             button_label="Install gpt",
             toolbar="main",
             filter=project_contains_gpt)
def on_install_gpt_template():
    for source in GPS.Project.root().sources():
        if source.language().lower() == "gpt":
            install_template.GptInstaller(source.name()).install()
