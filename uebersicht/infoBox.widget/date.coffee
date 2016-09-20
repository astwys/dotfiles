command: "date +\"%b %d\""

refreshFrequency: 10000

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #faf9f5
  //color: #212121
  font: 14px -apple-system
  left: 120px
  top: 8px
"""
