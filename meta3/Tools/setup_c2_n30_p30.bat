for /l %%x in (2201, 1, 2230) do (
   python gen.py 30 0.3 %%x input.txt
   call code2.exe %%x 1000 input.txt >> output2_n30_p30.txt
)