import http.server
import socketserver
import webbrowser
import os

PORT = 8000
DIRECTORY = os.path.dirname(os.path.abspath(__file__))

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

def run_server():
    port = PORT
    max_attempts = 10
    httpd = None
    
    for attempt in range(max_attempts):
        try:
            httpd = socketserver.TCPServer(("", port), Handler)
            break
        except OSError as e:
            if e.errno == 10048: # Port already in use
                print(f"[!] Portul {port} este ocupat. Încercăm portul {port + 1}...")
                port += 1
            else:
                raise e
    
    if not httpd:
        print("[ERORE] Nu s-a putut găsi un port liber după 10 încercări.")
        return

    print(f"==========================================")
    print(f" Servitorul rulează la: http://localhost:{port}")
    print(f"==========================================")
    print("Deschidem browserul...")
    webbrowser.open(f"http://localhost:{port}")
    
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nServitor oprit.")
        httpd.shutdown()

if __name__ == "__main__":
    run_server()
