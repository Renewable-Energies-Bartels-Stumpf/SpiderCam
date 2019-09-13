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
  for x in 2..array.length do
    key = array[x]
      y=x−1
      puts "test"
        while y > 0 and array[y] > key do
          array[y + 1]    = array[y]
          y               = y−1
          array[y + 1]    = key
        end
  end
  return getstring(array)
end

def selectionsort(array)
  for y in 0..array.length - 1 do
    min = array[y]
    for x in 0..array.length-1 do
      if array[x] < min then
        min = array[x]
      end
    end
    if min != array[y] then
      ablage        = array[x]
      array[x]      = array[x + 1]
      array[x + 1]  = ablage
    end
  end
end

#main

Liste = [18,9,3,5,2,17,4,16,14,500]

puts "Bubblesortsort: " + bubblesort(Liste).to_s

puts "Einfügensort: " + insertionsort(Liste).to_s

#end main
