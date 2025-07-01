

-- shadenote.lua
-- Convert \begin{shadednote}...\end{shadednote} into ::: {.shadednote} ... ::: (HTML only)

local function extract_shadenote_content(raw_latex)
  -- Match the content inside \begin{shadednote}...\end{shadednote}
  return raw_latex:match("\\begin{shadednote}(.-)\\end{shadednote}")
end

function RawBlock(el)
  if FORMAT:match("html") then
    local content = extract_shadenote_content(el.text)
    if content then
      -- Parse the content as Markdown to preserve formatting
      local parsed_blocks = pandoc.read(content, "latex").blocks
      return pandoc.Div(parsed_blocks, {class = "shadednote"})
    end
  end
  return nil
end
