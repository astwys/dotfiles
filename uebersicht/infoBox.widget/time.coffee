command: "date +%R"

refreshFrequency: 1000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #faf9f5
  //color: #212121
  font: 14px -apple-system
  left: 20px
  top: 8px
"""
