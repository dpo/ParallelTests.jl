using Distributed
using Test

using ParallelTests

np = Sys.CPU_THREADS
addprocs(np - 1)

for p = 1 : np - 1
  @fetch begin
    #define test set on this worker
    function mytest()
      @testset "some tests" begin
        @test 1 == 1
      end
    end
    # execute test set
    mytest()
  end
end

# @fetch begin
#   function test1()
#     @testset "test1" begin
#       @info "test1 running on worker $(myid())"
#       @test 1 == 1
#     end
#   end
#   test1()
# end

# @fetch begin
#   function test2()
#     @testset "test2" begin
#       @info "test2 running on worker $(myid())"
#       @test 1 == 1
#     end
#   end
#   test2()
# end

# @fetch begin
#   function test3()
#     @testset "test3" begin
#       @info "test3 running on worker $(myid())"
#       @test 1 == 1
#     end
#   end
#   test3()
# end

# @fetch begin
#   function test4()
#     @testset "test4" begin
#       @info "test4 running on worker $(myid())"
#       @test 1 == 1
#     end
#   end
#   test4()
# end

# @fetch begin
#   function test5()
#     @testset "test5" begin
#       @info "test5 running on worker $(myid())"
#       @test 1 == 1
#     end
#   end
#   test5()
# end

# @fetch begin
#   function test6()
#     @testset "test6" begin
#       @info "test6 running on worker $(myid())"
#       @test 1 == 1
#     end
#   end
#   test6()
# end

# @fetch begin
#   function test7()
#     @testset "test7" begin
#       @info "test7 running on worker $(myid())"
#       @test 1 == 1
#     end
#   end
#   test7()
# end

