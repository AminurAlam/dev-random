def same:
    if true then
        .
    elif true then
        .
    else
        .
    end
;

def tworounds(a; b):
    (a | round) + (b | floor)
;

{
    "input": .,
    "inbuilt functions": [
        (123 | tostring)
    ],
    "user defined functions": [
        ("same" | same),
        tworounds(5.12; 5.24)
    ],
    "arithematic": [
        1+1,
        1-1,
        pow(2;4)
    ]
}
