# This is for practicing Sandi Metz's bicycle example from her POODR book.
# Object Oriented Design of a bike
# Please see all commits to understand the stages of building this code

#Understanding bike gears
chainring = 52
cog = 11
ratio = chainring / cog.to_f
puts ratio

chainring = 30
cog = 27
ratio = chainring / cog.to_f
puts ratio
