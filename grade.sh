CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
cd student-submission
if [[ -f ListExamples.java ]]
then 
    echo "ListExamples found"
else 
    echo "need file ListExamples.java"
    exit 1
fi


cp ../TestListExamples.java ./
javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java > javac-errors.txt
if [[ $? -eq 0 ]]
then 
    echo "compile success"
else
    echo "compile failed"
fi

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > test_results.log
# if [[ grep -q "FAILURES" test-results.log ]]
# then 
#     echo cat test_results.log
# else
#     echo "Passed"
# fi
cat test_results.log
echo 'Finished cloning' 
echo 'Finished cloning'

cp student-submission/ListExamples.java ./
javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

