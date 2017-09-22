defmodule Calculator do
  def start do
    students = [
      %Student{name: "João Doe",   results: build_subjects([5.2, 3.9, 2.7, 9.8])},
      %Student{name: "Maria da Silva", results: build_subjects([8.4, 7.5, 9.4, 2.8])},
      %Student{name: "Luis Inácio",  results: build_subjects([1.3, 8.5, 8.9, 7.6])},
      %Student{name: "Kauã Camboinhas",results: build_subjects([5.4, 4.9, 2.2, 3.8])}
    ]

    results = calculate(students)
    best = best_results(results)

    %{results: results, best: best}
  end

  def calculate(students) do
    students
    |> Enum.map(&(
      %{
        first_name: Student.first_name(&1),
        last_name: Student.last_name(&1),
        average: average(&1)
      }
    ))
  end

  defp best_results(students) do
    best =
      students
      |> Enum.map(&(&1.average))
      |> Enum.max


    students
    |> Enum.filter(&(&1.average == best))
  end

  defp average(student) do
    total = Enum.count(student.results)

    result =
      student.results
      |> Enum.map(&(&1.result))
      |> Enum.reduce(&(&1 + &2))

    Float.ceil(result / total, 2)
  end

  defp build_subjects(results) do
    subjects = ["Matemática", "Português", "Geografia", "História"]

    subjects
    |> Enum.map(&(%Subject{name: &1, result: Enum.random(results)}))
  end
end
