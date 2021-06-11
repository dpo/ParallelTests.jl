using Distributed

np = Sys.CPU_THREADS
addprocs(np - 1)

@everywhere using Test

@everywhere using IOCapture
@everywhere using ParallelTests

# @everywhere function test1()
#   @testset "test set 1" begin
#     @test 1 == 1
#   end
# end

# @everywhere function test2()
#   @testset "test set 2" begin
#     @test 1 == 1
#   end
# end

# @everywhere function test3()
#   @testset "test set 3" begin
#     @test 1 == 1
#   end
# end

# @everywhere function test4()
#   @testset "test set 4" begin
#     @test 1 == 1
#   end
# end

# @everywhere function test5()
#   @testset "test set 5" begin
#     @test 1 == 1
#   end
# end

# @everywhere function test6()
#   @testset "test set 6" begin
#     @test 1 == 1
#   end
# end

# @everywhere function test7()
#   @testset "test set 7" begin
#     @test 1 == 1
#   end
# end

# all_tests = [test1, test2, test3, test4, test5, test6, test7]
# pmap(i -> all_tests[i](), 1 : (np - 1))

futures = Future[]

future1 = @spawnat :any begin
  c = IOCapture.capture(color = true) do
    @testset "test set 1" begin
      @test 1 == 1
    end
  end
end
push!(futures, future1)

future2 = @spawnat :any begin
  c = IOCapture.capture(color = true) do
    @testset "test set 2" begin
      @test 0 == 1
    end
  end
end
push!(futures, future2)

future3 = @spawnat :any begin
  c = IOCapture.capture(color = true) do
    @testset "test set 3" begin
      @test 1 == 1
    end
  end
end
push!(futures, future3)

future4 = @spawnat :any begin
  c = IOCapture.capture(color = true) do
    @testset "test set 4" begin
      @test 1 == 1
    end
  end
end
push!(futures, future4)

future5 = @spawnat :any begin
  c = IOCapture.capture(color = true) do
    @testset "test set 5" begin
      @test 1 == 1
    end
  end
end
push!(futures, future5)

future6 = @spawnat :any begin
  c = IOCapture.capture(color = true) do
    @testset "test set 6" begin
      @test 1 == 1
    end
  end
end
push!(futures, future6)

future7 = @spawnat :any begin
  c = IOCapture.capture(color = true) do
    @testset "test set 7" begin
      @test 1 == 1
    end
  end
end
push!(futures, future7)

# now check futures in turn and fetch results when ready
while length(futures) > 0
  for k = 1 : length(futures)
    future = futures[k]
    if isready(future)
      @info "results $k are ready"
      c = fetch(future)
      printstyled(c.output)
      popat!(futures, k)
      break
    end
  end
end

rmprocs()
