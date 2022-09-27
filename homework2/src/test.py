import sys
import subprocess
import random


# Устанавливаем seed, чтобы воспроизводить тесты.
TEST_COUNT = 7 
MAX_ARRAY_LENGTH = 7 
MIN_ARRAY_LENGTH = 3
SEED = 42

random.seed(SEED)

program_name = sys.argv[1]

for i in range(TEST_COUNT):
	input_array_length = random.randint(MIN_ARRAY_LENGTH, MAX_ARRAY_LENGTH)
	input_array = [random.randint(-100, 100) for _ in range(input_array_length)]
	input_data = list(map(str, input_array))
	
	execution_result = subprocess.run([program_name] + input_data, stdout=subprocess.PIPE)
	output_data = execution_result.stdout.decode("utf-8")
	
	normalized_data = output_data[8:-2]
	output_array = list(map(int, normalized_data.split()))

	answer = sorted(input_array)
	
	if (answer != output_array):
		print(f"Wrong answer on test {input_array}")
		print(f"Correct answer is {answer}")
		print(f"Program answer is {output_array}")
	else:
		print(f"Test {input_array}")
		print(f"Program answer is correct")
	
	print()
	
