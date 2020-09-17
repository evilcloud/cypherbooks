import os

fn main() {
	if os.args.len < 2 {
		println('Please provide the name of the cypher file')
		return
	}
	path := os.args[1]
	contents := os.read_file(path.trim_space()) or {
		println('failed to open $path')
		return
	}
	lines := contents.split_into_lines()
	// mut new_content := []
	mut markerbase := map[string]string
	for line in lines {
		l := line.trim_space()
		if l.len > 4 && l[..4] == '// :' {
			n := l[4..].split(':')
			if n.len < 2 {
				return
			}
			marker := n[0].trim_space()
			value := n[1..].join(':').trim_space()
			markerbase[marker] = value
			mut marker_string := " "
			for m, v in markerbase {
				marker_string += ', ' + m + ': ' + '"' + v +'"'
			}
			println(marker_string)
		} else {
			for item, _ in markerbase {
				if item in line {
					println('$item')
				}
				println(line)
			}
		}
		// println(new_content)
	}
}