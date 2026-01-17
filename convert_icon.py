from PIL import Image
import os

def convert_to_ico():
    img_path = 'icon.png'
    ico_path = 'icon.ico'
    if os.path.exists(img_path):
        img = Image.open(img_path)
        # Standard sizes for Windows ICO
        img.save(ico_path, format='ICO', sizes=[(16, 16), (32, 32), (48, 48), (64, 64), (128, 128), (256, 256)])
        print(f"Iconita convertita cu succes: {ico_path}")
    else:
        print("Eroare: icon.png nu a fost gasit.")

if __name__ == "__main__":
    convert_to_ico()
