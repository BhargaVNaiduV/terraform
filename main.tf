resource "local_file" "jedi" {
     filename = var.jedi["filename"]
     content = var.jedi["content"]
}

