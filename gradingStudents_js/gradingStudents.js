const gradingStudents = (grades) => {
    return grades.map(
        grade => {
            switch (true) {
                case grade < 38:
                    return grade
                case (grade % 5) > 2:
                    return grade + (5 - (grade % 5))
                default:
                    return grade
                    // Brute force:
                    /*
                case String(grade + 1).slice(-1) === '0':
                    return grade + 1
                case String(grade + 2).slice(-1) === '0':
                    return grade + 2
                case String(grade + 1).slice(-1) === '5':
                    return grade + 1
                case String(grade + 2).slice(-1) === '5':
                    return grade + 2
                default:
                    return grade
                    */
            }
        }
    )

}