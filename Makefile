CC = g++
CFLAGS=-Wall -Werror -Wextra -std=c++17 -Wpedantic
#CFLAGS=-Wall -Werror -Wextra -O2 -pedantic -std=c++17 -Wshadow -Wlogical-op -Wshift-overflow=2 \
			-Wduplicated-cond -Wcast-align -Wfloat-equal -Wconversion -Wcast-qual -D_GLIBCXX_DEBUG \
			-D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined \
			-fno-sanitize-recover -fstack-protector -fanalyzer

SOURCES = s21_matrix_oop.cpp
OBJECTS = $(SOURCES:.cpp=.o)

all: clean test

main: s21_matrix_oop.a main.cpp
	$(CC) $(CFLAGS) main.cpp -L. -l:s21_matrix_oop.a -o main

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf *.a *.o *.css *.gcda *.gcno *.html main unit_test

s21_matrix_oop.a: $(OBJECTS)
	ar rcs $@ $^

test: clean
	$(CC) $(CFLAGS) unit_test.cpp -c 
	$(CC) $(CFLAGS) -o unit_test unit_test.o s21_matrix_oop.cpp --coverage -lgtest -lgtest_main
	chmod +x unit_test
	./unit_test
	gcovr -r . --html-details -o coverage_report.html

format:
	clang-format -n *.cpp *.h

formati:
	clang-format -i *.cpp *.h

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem --std=c++17 --language=c++ *.cpp *.h

valgrind:
	valgrind --trace-children=yes --track-fds=yes --track-origins=yes --leak-check=full --show-leak-kinds=all -s  ./unit_test