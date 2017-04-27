l (num)
    fact = 1
    num.times do |i|
        i += 1
        fact *= i
    end
    return fact
end

def reverse(string)
    rev = String.new
    i = 0
    while i < string.size
        rev = string[i] + rev
        i += 1
    end
    return rev
end

def sort (array)
    i = 0
    while i < array.size
        j = i + 1
        while j < array.size
            if array[j] < array [i]
                aux = array[i]
                array[i] = array[j]
                array[j] = aux
            end
            j = j + 1
        end
        i = i + 1
    end
    return array
end

def upcase (string)
    i = 0
    while i < string.size
        if string[i].ord >= 97 && string[i].ord <= 122
            string[i] = (string[i].ord - 32).chr
        end
        i += 1    
    end
    return string
end
