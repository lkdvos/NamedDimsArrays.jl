@eval module $(gensym())
using Test: @testset

@testset "NamedDimsArrays.jl" begin
  filenames = filter(readdir(@__DIR__)) do filename
    startswith("test_")(filename) && endswith(".jl")(filename)
  end
  @testset "Test $(@__DIR__)/$filename" for filename in filenames
    println("Running $(@__DIR__)/$filename")
    @time include(filename)
  end
end
end
