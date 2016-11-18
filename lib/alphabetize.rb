
def alpha
  esperanto_alphabet = "abcĉdefgĝhĥijĵklmnoprsŝtuŭvz"
  count = 0
  alpha_code = Hash.new(0)
  esperanto_alphabet.split("").each do |char|
    count += 1
    alpha_code[char] = count
  end
  alpha_code
end

def create_hash_to_sort(arr)
  arr_hash = Hash.new(0)
  alpha_code = alpha()

  arr.each_with_index do |word, idx|
    before_word = arr[idx-1]
    after_word = arr[idx+1]
    w_idx = 0

    while before_word[w_idx] == word[w_idx]  do
      w_idx += 1
    end

    alpha_code.each do |char, value|
      if word[w_idx] == char
          arr_hash[value]= word
      end
    end
  end
  arr_hash
end

def alphabetize(arr)
  sorted_hash = Hash.new(0)
  hash_to_sort = Hash.new(0)

  hash_to_sort = create_hash_to_sort(arr.sort)
  sorted_array = hash_to_sort.sort_by { |key, value| key.to_i }
  sorted_array.flatten.select { |item| item == item.to_s ? item : nil }
end
