# Include Code Files Extension For Quarto

Filter to include code from source files.

The filter is largely inspired by
[pandoc-include-code](https://github.com/owickstrom/pandoc-include-code).

## Installing

```bash
quarto add JakeJing/include-code-files
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Usage

The filter recognizes code blocks with the `include` attribute present. It swaps the content of the code block with contents from a file.

Here is how you add the filter to a page (it can also be added to a `_quarto.yml` project file with the same syntax):

````markdown
---
title: "My Document"
filters:
   - include-code-files
   - shadenote
---

````

### Including Files

Once adding the filter to you page or project, the simplest way to use the filter is the `include` attribute

    ```{.python include="script.py"}
    ```

You can still use other attributes, and classes, to control the code blocks:

    ```{.python include="script.py" code-line-numbers="true"}
    ```

### Ranges

If you want to include a specific range of lines, use `start-line` and `end-line`:

    ```{.python include="script.py" start-line=35 end-line=80}
    ```

### Dedent

Using the `dedent` attribute, you can have whitespaces removed on each line, where possible (non-whitespace character will not be removed even if they occur
in the dedent area).

    ```{.python include="script.py" dedent=4}
    ```

### Snippets

Using the `snippet` attribute, one may use ``pandoc-include-code`` style 
snippets, for instance

    ```{.python include="script.py" snippet="main"}
    ```

will include the snippet 'main' which is enclosed between ``# start snippet main``
and ``# end snippet main`` in the following 

```python
# script.py

# start snippet main
def main():
    print("It works!")

# end snippet main
```


For now this should support include for ``python``, ``r``, ``julia``, ``html``,
``js``, ``ojs``, and ``css``. It might work on other documents too, but will 
have to guess.


### shadenote in pdf and html

The shadenote.lua will automatically detect the shadenote chunk and convert it into a compatiable html shaded note. In order to make it work, you also need to include a `css/shadenote.css` file in your working directory.

```{=latex}
\begin{shadednote}
This is a PDF/HTML compatible note.
\end{shadednote}
```

```
.shadednote {
    background-color: #f0f0f0; /* Light gray */
    border: 1px solid #888888;
    border-radius: 6px;
    padding: 1em;
    margin: 1em 0;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
}
```

