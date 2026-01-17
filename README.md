# Profesor Virtual UOC

**Agent AI portabil pentru profesorii și studenții Universității Ovidius din Constanța.**

Acest proiect este un asistent virtual conceput pentru a facilita interacțiunea dintre studenți și un model de inteligență artificială specializat, care adoptă rolul unui profesor universitar de la Universitatea Ovidius din Constanța. Interfața web locală permite o comunicare fluidă și personalizată.

![Screenshot](icon.png) 

## Cuprins

- [Caracteristici](#caracteristici)
- [Cerințe](#cerințe)
- [Instalare](#instalare)
- [Utilizare](#utilizare)
- [Dezvoltare](#dezvoltare)

## Caracteristici

- **Interfață Web Modernă:** O interfață curată și intuitivă pentru chat.
- **Personalizare Rol:** Posibilitatea de a personaliza facultatea, specializarea și numele profesorului pentru a adapta personalitatea AI-ului.
- **Selecție Model AI:** Permite selectarea oricărui model de limbaj disponibil în instanța locală de Ollama.
- **Persistentă:** Setările sunt salvate local în browser pentru o utilizare ulterioară facilă.
- **Portabil:** Rulează local, fără a necesita o conexiune la internet (cu excepția descărcării inițiale a modelelor Ollama).
- **Markdown:** Suport pentru formatare Markdown în răspunsurile AI-ului, pentru o lizibilitate sporită.

## Cerințe

Pentru a rula acest agent, aveți nevoie de următoarele:

1.  **Python:** Asigurați-vă că [Python](https://www.python.org/downloads/) este instalat și adăugat în PATH.
2.  **Ollama:** Este necesar să aveți [Ollama](https://ollama.ai/) instalat și să ruleze în fundal. De asemenea, trebuie să aveți cel puțin un model de limbaj descărcat (de ex. `ollama run llama2`).

## Instalare

Cea mai simplă metodă de a instala aplicația este prin executarea fișierului `ProfesorVirtualUOC_Setup.exe`. Acesta va instala toate fișierele necesare și va crea un shortcut pe Desktop și în meniul Start.

## Utilizare

După instalare, pur și simplu lansați aplicația folosind shortcut-ul **"Profesor Virtual UOC"**.

Alternativ, puteți rula fișierul `START_PROFESOR.bat` direct din folderul proiectului. Acesta va porni un server local și va deschide automat interfața într-un browser web.

## Dezvoltare

Dacă doriți să rulați proiectul direct din sursă, urmați pașii:

1.  Clonați acest repozitoriu.
2.  Asigurați-vă că aveți îndeplinite [cerințele](#cerințe).
3.  Executați comanda în terminal:
    ```bash
    python run_agent.py
    ```
4.  O nouă fereastră de browser se va deschide cu interfața aplicației.
