using Distributed

np = Sys.CPU_THREADS
addprocs(np - 1)

@everywhere using Test
@everywhere using ParallelTests

@everywhere function test1()
  @testset "test set 1" begin
    @test 1 == 1
  end
end

@everywhere function test2()
  @testset "test set 2" begin
    @test 1 == 1
  end
end

@everywhere function test3()
  @testset "test set 3" begin
    @test 1 == 1
  end
end

@everywhere function test4()
  @testset "test set 4" begin
    @test 1 == 1
  end
end

@everywhere function test5()
  @testset "test set 5" begin
    @test 1 == 1
  end
end

@everywhere function test6()
  @testset "test set 6" begin
    @test 1 == 1
  end
end

@everywhere function test7()
  @testset "test set 7" begin
    @test 1 == 1
  end
end

all_tests = [test1, test2, test3, test4, test5, test6, test7]
pmap(i -> all_tests[i](), 1 : (np - 1))
rmprocs()

