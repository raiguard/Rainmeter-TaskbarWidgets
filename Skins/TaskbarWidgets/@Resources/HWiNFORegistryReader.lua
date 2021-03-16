function ParseOutput(measureName)
  local raw = SKIN:GetMeasure(measureName):GetStringValue()

  local output = ""

  -- Match over each group as a whole
  local match_string = "    Sensor(%d-)    .-    (.-)\n    .-    .-    (.-)\n    .-    .-    (.-)\n    .-    .-    (.-)\n    .-    .-    (.-)\n"
  for index, sensor, label, value, value_raw, color in raw:gmatch(match_string) do
    output = output
      .."\n"
      .."Index "..index.."\n"
      .."Sensor        "..sensor.."\n"
      .."Label         "..label.."\n"
      .."Value         "..value.."\n"
      .."ValueRaw      "..value_raw.."\n"
      .."Color         "..color.."\n"
  end

  -- Write to a file
  local file = io.open(SKIN:GetVariable("CURRENTPATH").."output.txt", "w")
  file:write(output)
  file:close()
end