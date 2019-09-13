#﻿date of issue: 20.11.2018
#created by	  : Andreas Stumpf

def getstring(array)
  string = ""
  for i in 0..array.length - 1 do
    string = string  + array[i].to_s + "  "
  end
  return string
end

def bubblesort(array)
  for y in 0..array.length - 1 do
    for x in 0..array.length - 2 do
      if array[x] > array[x + 1] then
        ablage        = array[x]
        array[x]      = array[x + 1]
        array[x + 1]  = ablage
      end
    end
  end

  return getstring(array)

end

def insertionsort(array)
  puts "test"
  for j in 2..array.length do
    puts "test"
    key = array[j]
    puts "test"
      i = (j − 1)
      puts "test"
        while i > 0 and array[i] > key do
          array[i + 1]    = array[i]
          i               = (i − 1)
          array[i + 1]    = key
        end
  end
  return getstring(array)
end

#main

Liste = [18,9,3,5,2,17,4,16,14,500]

puts "Bubblesortsort: " + bubblesort(Liste).to_s

puts "Einfügensort: " + insertionsort(Liste).to_s

#end main
