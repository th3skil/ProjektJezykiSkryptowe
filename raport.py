import os
from datetime import date, datetime
from os.path import isfile, join, exists

if exists("Raport.html"):
   os.remove("Raport.html")
now = datetime.now()
fulldate = now.strftime("%d-%m-%Y %H:%M:%S")


outputfile = open("Raport.html", "w")

outputfile.write(f"""

<html>
  <head>
    <title>Raport</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
  <h1>Raport {fulldate}</h1>
  <table>
    <tr>
      <th>input</th>
      <th>output</th>
    <tr>
    """)
inputfiles = [file for file in os.listdir("input") if isfile(join("input", file))]
for x in range(len(inputfiles)):
    outputfile.write("""

    <tr>
          <td>""")
    outputfile.write(f"input{x}\n")
    with open(f"input/input{x}.txt", "r") as f:
        lines = [int(line.rstrip()) for line in f]
    outputfile.write(str(lines))

    outputfile.write("""</td>
          <td>""")
    outputfile.write(f"output{x}\n")
    with open(f"output/output{x}.txt", "r") as f:
        lines = [int(line.rstrip()) for line in f]
    outputfile.write(str(lines))
    outputfile.write("""</td>
        </tr>""")
outputfile.write("""
  </table>
  </body>
</html>""")

outputfile.close()