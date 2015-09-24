#!/usr/bin/swift

dump(Process.arguments)

func greet(name: String) -> String
{
	return "Hello " + name + "!"
}

var nothing: String = greet("Andres")

println(nothing)


