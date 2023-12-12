# Prepared by Hasya Hamdan

#cross check the fixed and float

def twos_comp(val,integer_precision,fraction_precision):
    flipped = ''.join(str(1-int(x))for x in val)
    length = '0' + str(integer_precision+fraction_precision) + 'b'
    bin_literal = format((int(flipped,2)+1),length)
    return bin_literal

def float_to_fp(num,M,N):   
    
    #sign bit is 1 for negative numbers in 2's complement representation
    if(num<0):
        sign_bit = 1                                          
        num = -1*num        
    else:
        sign_bit = 0

    #set integral to M bits    
    precision = '0'+ str(M) + 'b'
    integral_part = format(int(num),precision)

    #set fractional to N bits
    fractional_part_f = num - int(num)
    fractional_part = []
    for i in range(N):
        d = fractional_part_f*2
        fractional_part_f = d -int(d)        
        fractional_part.append(int(d))
    fraction_string = ''.join(str(e) for e in fractional_part)
    if(sign_bit == 1):
        binary = str(sign_bit) + twos_comp(integral_part + fraction_string,M,N)
    else:
        binary = str(sign_bit) + integral_part+fraction_string
    return str(binary)

def fp_to_float(s,integer_precision,fraction_precision):       #s = input binary string
    number = 0.0
    i = integer_precision - 1
    j = 0
    if(s[0] == '1'):
        s_complemented = twos_comp((s[1:]),integer_precision,fraction_precision)
    else:
        s_complemented = s[1:]
    while(j != integer_precision + fraction_precision ):
        number += int(s_complemented[j])*(2**i)
        i -= 1
        j += 1
    if(s[0] == '1'):
        return (-1)*number
    else:
        return number


