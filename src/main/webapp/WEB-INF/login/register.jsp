<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 5/15/2023
  Time: 9:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<section class="vh-100" style="background-color: #eee;">
    <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
                <div class="card text-black" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                                <form class="mx-1 mx-md-4">

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="text"  class="form-control" name="name"/>
                                            <label class="form-label" for="form3Example1c">Your Name</label>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="text" id="form3Example1c" class="form-control" name="userName" />
                                            <label class="form-label" for="form3Example1c"> UserName</label>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="email" id="form3Example3c" class="form-control" name="email" />
                                            <label class="form-label" for="form3Example3c">Your Email</label>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="password" id="form3Example4c" class="form-control" name="password" />
                                            <label class="form-label" for="form3Example4c">Password</label>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="password" id="form3Example4cd" class="form-control" name="rePassword"/>
                                            <label class="form-label" for="form3Example4cd">Repeat your password</label>
                                        </div>
                                    </div>



                                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                        <button type="button" class="btn btn-primary btn-lg">Register</button>
                                    </div>

                                </form>

                            </div>
                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAf4AAABjCAMAAABNPpI+AAAAeFBMVEX///9JZ6lAYaY5XKQ0WaM9X6W3wdr29/pGZaidq8xEY6f6+/08XqUzWKKRoMd3i7zn6vJWca/h5e/x8/hfeLKZp8vW2+lPbKyvutXK0eOlsdB+kb9kfLTQ1uaImcNXcq+0vtjCyt9uhLiMnMUgTZ4WSJx7jr5qgbdqQmZQAAATK0lEQVR4nO1dW5uyvA4daVFEUEc8IJ6dd7/+/3+4QQUKWWnDjN92vv2wLuZihNJ2tUmTpunHhxXzwzDNVtMCq3F2vizsj//LMEkW6+0wm767Hq/DaL44XM7Z5QVFHVbLWEe+74XeA74fqf+8oOD3Yp4znq6Os2UQx1qpvIHq3VX6GUaLw/acTXfXUxRrraLI16ufljmfKuUFA4L4FRV+J0Z/ig7yvLBqXOC9u04/Q/pHqWKShkHZJG/8sxKTXYy4/7+gX7Wb9G+nf+i3W/RD+ofag9z39P9GvJr+aYxnfk//r8SL6T+SDurp/814Lf2ZtrDf0//78FL6F7GN/Z7+34eX0n/i9X5P/6/EK+m/2BR/T/9vxCvpd0z+nv7fhxfSv7Cu+3r6fyNeSP+K9ff09P9WvJD+Tyz7Q89/4s9La/4G9PTzSJDVF6rNbpU98cPNhPejp5/HNqLs+/v1a6v7XvT080hJSQNv9trKvhs9/Ty+yMov8Cevrey70dPP40pWft6PA0d+GXr6eVCnjzq8tq5vR08/j3Y5g4FOXlvXt6Onn4dPZr9+bVXfj55+HnS/J3ptVd+Pnn4e1OPf0//r0dPfAT39PHr6/4Xo6e+Ann4ePf3/QvT0d0BPP4+e/n8hevo7oKefx3fpnywu6Xg6nY7T7fx7X/6foae/gaTGiHbNwB+NkgZoCYtsr5QqzkwXGQB0eNzC0tn3G5hvi7P3+9Np87m87b6yy3rkbsJ6OC7e+fw8La/H8dD6ioP+yTo93k6fp/1smh7cn27X5HBe7a7L0+aUV36aXr41FybrS9mc/ewrG64dW+5C+ikVSTL50CYI+4NB43cdk1i/4Un7YbM3VZg+f1z80S38sbTlMN5H+n72PgwKhPl4ipQ6Tbf8O8lwN9Aq8st3gvsryzEboWSl/7ArxvG9pPzbSi8zOYHJ5ZjX5Pn2s/I6umXdEqKsV0tVN6fsgZWlB4T0z+I2FTo+oU0+G4Jls9DLIELBodHm0f0L0teKo3+b97wXgrKK8aSOsBMn56WO0DuBrzcZnrsW+refOmyXE19loW6Xq45AlHQQ+nowlo6hxdSDOTXuPcDWQ0T/FkztOOlMfyP0K7lxxwKC+C4ApPRP0kBB6svivPhK+jCZKjj2nvDVCn2LpT+5alRaqOmXCfLq22oSzyRjaH3jcmrcK6mXjAgQ0Q+KVCn+vwXel1HkwUaZLqogpP8c0RjDNsL43HxprPnOesD3QIojjv4DFCOPL6e0GBO5CHRWfuZa9DCjz6ynXkIZKKEfnN8I74LcUfEWfKPgoSULRA6dCumfL21Tp0LUIGG9cY+YvA5H8jWGfmtj1M7C22TmOhlVwDWG0tgm/apCUOidgH50bDu+CzVB1Q34dSOG9pPgeflrEf1DScMHrbij1D706vou29/D9Dsa4+9Z3tae62DUE+pqWfXOHCdrS0RLuqIR0L+kXRxlH93pV5U4PbjYzwerhP6pZO4UhZkMfAlfynti0+ovSP/a1RjvxvB2cXdDVcaAUwDJRjiE8m4IyUrETf+ZDq7wuYYX1/4OVa5hEoHA9ldzJ/1fwmE/8M/1S9b0My2EJyf94YdLd+efx/LfKQIbVYnwIjIJZPLvUVtSiJN+xFU8/w79uvz2UiJ81YH0a4v+lZhIQ/bLXyrg/3XRv6HHG8D3zx8U2y7sF3Ykmv+jjUyRlYV4rUKc9P+lzXuK/q70x09RmooYCG40cLxBv1x0GrK/Y58P9NBOf164pJiYUudIhAM+tAH078WS/1lIS5656Acmf1AV0e3TcdmHsgFLn2rQn7hsnRq17JeonWYllKn+Ef0ihFdCHGifA95fUsjKrXla8JtJiF30gxLiheVHC56jdyWxuiAa9N/kOq+W/TM4WTyl4yJHLw1Vz38zzb9v0z/Q7RMvx2/0gm67IpyrToC44UVy0A+4iurfO303fCyAR9+o8hMm/cgRyX24kv2wu3z1dZmPJqP5ITsBiRIbq6Xv0992eLPEBUX+6xBLhqYoysEq/tBSSEOH2OkHCir4rH9mPs5U6bH+zZhhHxb7E1HkWya1ST/b8mLfpoBf+fVq2b+nhQexOdrXJ1K70PBV2ugPvfyjyud0sW66bvHqN4zi/XE8ns4ihcVUU3KnUPQHfrzZrcar3WeMxNkgMpczdvqByR8bzsPABKqJCX9lGTK+3p0P68P2ks00q88M+reYiKL/pullu90Os+MyfojzSvavgcSIWr5QakwaU46n34/34+F2e0m/Njincdgw/mD1A72vPPPrI/RNNZeQ8EO+l5YPJSl2K0npBya/b7oOPw2gtF4n84FNylGQN2tsTOzhgBEQBv1Q8+f9d2kYB+vxp/Zq2b+jnaGJNU2UsjFbOPpDPa55WTDMmTUD0yo3yhvbMvNP8Exj+g/RPNFNAYF8XMpYQtjoB2v0AFkfD8iifVD+p8BrT0Gs2Gv650h1ehtwongx/VP6mieUPDWkb7TVSlCv2hn6vWXTrlsgR5wpc5HRFwRt4/BGSwlM/YcmXHtv6+NMPxUaXkgb/cDkj/ndRxn9tMZ5m8gUzGA/120HmUQGEZNKZFR264XMlnAJnieCWVfSH9PvUasOmOOhYbZNwfCgcujjBLzt9SBCclRlpJCMyghDhVjoBy4S33J1jYh+lP+J2DMfUE6b9IM1nE+t4haOpMwI7oK3J5WqnoL0m2vhCmBlalz7AnabozMtBMg4QxSx+7AtUPeZuffG0w9aOgDFlxDRD/K+BnTy5IIaLVor+kc2XxQL+g6ORW33q29oQ1qpxlq4Akhxqarn1qAToFIdUyFXiyIwwjSSzXQQGT3O0w9MfovoF9IPhiysMxTvFf0H2n+QhAao4AnxVkw7RVndW4h+j4YFFKDiq7Y/ge2LJj/0kVSiaA6mAJr8eVWIqKwFEUs/WJ74X7D4J0T00wRAzLQFE7ymn/Yfw6QJOmZ8HEVBO7aqFKAf6OwCdPrXwU60E4xJ3QDVV5VspiuZxsamteHV3itPP7BNAkvnCumnMt2nqxWujyr6aa9gEdIAlSdM7iEy5ypuAP3MjAPr8toABTvoTEgIzZVYLdvB8pEZiXSp4VcLSI5+YPLH9kxNEvonQJoxxAEJWdFPfWa8PVqB9hfXXYT+UrGgswzM6P0Ytz9XrTSA2ObOVlDpX4UWU89HEDJVIdK/dh8w9AOTn1FyFST0g5Zz0dtAv1ePkuHsCS7T/Ev6i0s91a5kJSUA/dh4+EATt3T8gJZF3NWZG/JoWWnyA15DFyByr36SoR8YXqHjwIiEfrDm5eatZaRQGcJ2nwFqLKrFHKJdycpNBujnJAiof/ko8NZxIhCM2eejEyBCuDlARmK93sL0g2C82HZYpICEfjolAi7vK+jqkn7as0pwHAY4yRQ5vFKAfLjytSD6uUlBfYwlx0CtsYOIWkpPcQNmB6uHSNRkfTYJ00+KHnjOpbWEfmr28yqFp58GgTIL5waoHJWiWlGjIcl+j2yClToEGb9c/elQeY5F2gecIYOGSnWzAqQfmPyeMz2viH4y+3mtDUTksw5UhUgyCP6A/rJfke6Xf69cJlC7hZchlP5nZYAa9cEGxh0Jpb8cboD+DDgbtUv0y+inao/P+9uFfslRclKcGBb6LQe8ye0WpceGumF4+qm1+qwMWj/K6a8WvYh+alOAMDOCN9LPmjwmSHFivIj+cn36Q/ofGh7cnvAa+gPqTA4GgszsPf1NEPrLpv5u+gEC/pxSjZ7+Jgj9pWvvd9MfbNhDXVZ8c+n3f0s/NTSf6+2X6P5/jH6k+3nDtMY76Zdk2CHFifGi2V92+m9f+qEwA7f4/57b5zWGH2991/hnDD/+y6y/FhwL60L/mekDbsOvq+EH7X7lSFMgo5+OWd7tw9NPXR6SCyJdV8zy+B79NKTn6dxBbh/u/O4/5Pap/CSM1w/sSLtSTEjop5UGx58eQIGZrNNXoJtQaH0QiqAs9LP+OhCw8BykyOnLOa3pUHn6DumM5lOygaFS/iT2+bM8lZDQDyrNxY9Ztnxo3A67ZWJgRu3ZmQzX72z5AOn8nHMgUIO99QhE6jxGCtjyYUNe6JZPFaTA7PgBxyQKijYhCvcA+/3M9KHnu+sNX2ncTgNU5Xa+awgJf26v8UxNqmdMKFLbXP2pxirFDV1asOGOZAFRDxRuv5/mvSInzFoQ0S+/7ssW7kFNasF9kbTAzjeNAfrZpeuMhmM8KwmindmJS8M9ypArKszqBV0LZC7Xe4NctM8F6BZ7H4voP1J/MmP5gVjuin7atWzKvxpU5kpkRgMw0hc/CpYu1Uihi0LOfqSCohroJJqIDz1hN58ssX5XYJ1agypE9KMAXlgaUP01x7TprM1bAyw7BTsZDSD6mWUHlf21YUZjODhBRFd+1cQFfh9GhtCo0/qcB0s/WKUF1l1fEf1A7yk4ZtFhsIp+OpEth89KIFPC+VITiH4mxAodUygHCpgDjPaicqJOkMSk2qSgXVl3Fh/nD04HWWM+ZIe8gEcJxcqixtX0A+0pcEtTdSKQGQ1A4Q/3wlEOi+qQJ5Js0PQbUi9jPWKBIQsXIhOyjDMes5zyAX4SW7CvjH4Uv30Gj6ETvLWCpw5VwTkPemZGIDMawIe8QM4llHzCcJyCAzpoEkzo5DfkO0qUgDqBGnGGprHQD8+h8n0jox8pfzryx/CMf00/Ug2+i39wJtLvdsk0PuIZbtr8w9QjRlJTxBw4Q3MF1nctauAp54As/sEa3tggs53wnYLlC3/QR0Y/OuNJciyMXQe8wRE6zgQfZdXaDLwDU64ZOOzM5Q5zwDv0mvJ/BatvDHLYCaotuXdgkJhbmyjHQdAeisiCM8a8Nb0DqCR/zE94mweQ/nnXmJp7fmXyexjWHZD+g0BfiQA4HFWd8ACcmGynQzCRXI6eaqg7NruHvlaPzbOQCaEwCgJr/7y7bqYHcbFEIsLsJ5giJGzEvE9Q3lNzgWilH2V1Y9WlkH6cliXapI+2Tw7HdmL8Cgb9ZzhCQr1Mq+s4knX61y9y5FQzBq4n/cEZeEvml9VJR7nubbgl+OQugYqu03G22m00Q76Z0JpJ6hfo3eHRxOQyQ70QNN0baA7kzyyHD34n6xXKdt7YZLPn9gGnPVh1Kb3Lh0nK5GvvdLttFE5qdIfZeCYhe+ArNVjervuNp5X/SG5VW+bAlV1UU12z7SIZTT4mk2S+vmRfy+hO/b1Ac7jbUjsFYej7+E6JO5pGGcxfUKSYU5v9bRngiybakfxMdrMg0uHyti+6EkpaU8bY6UcpGLkltpR+cMT/We28B5mfHjDpx1mtqnLMVFO1nQOnf/GGHymtVPH3frmLGaKvX5LYre2S4WpSPBnCNFn3era6ks1taOnK5vR15PWjlifOZtGBfpjXCDWB/Kch+joks63XS8CX4YLpGf4B/XFrZxAcoXWX0Ta7kQPBgZbydmX13IM8JNjDIqYfWiwEoSOnb4eMloZfVjj0GvV4Bf00qgVYdQ4Aq2vYmf+W7HbRjwZYeyR3pJ9J3NRE4K8dGb3l+WwNL1fSffpra14/oSQDu6UgotYKD3lHjx3b0zZ0nRm9gbyEGYS6XOMoGPlq6MznL58/hrW8Fl7lYbSitqQo/Z5MnaDNssR1nVATzFmLW6fcwKq9bndf5wDMiwjtlHa5xfPkYi68Cm7zcJZSvWg4KwQ3iTRhyG1Kv04kqaV9GNA478J/yF3n0YV/RdSHm36kZNHWUhf6Jw7mwnyou+mfIM8IQmMrZGFLGwxgHCIA9M8FieWh2M6RfIrll39iY22kV/m00hc/ILjL54t2cgCup+l2h+/VVumwyHApucpJ2vTGMZDRrVtW/zpvEKLffUOE98nuk/+VXUoQaNtW61imzwKkgQT0T8BsAYF/Ha9wzvhLuPxTIVxEF7lZSmm82XRVny2+JYJAVwoT0u+8yYtcCGbgIriFcOCxAYUPrJ13AeZQe6Q9JPf4Id8vDXDueoP3Yo+9u2H80FCyaxxlF/lFLaU3msZSvaG8VWXoYPo/LpbpF4DrAE1MprFjKHrxlzN5RaZh7najAzwc2iC6xRNcgkHjvrtf4H7Yk4zzgRfvnzNVeonrZWO9w3WA78EcZYFTBHiRDqam3GDo/1hwOcgHvjvrUDJlXLz3/vDjo+QW39FY8dMgVMGZeU9EP7oCh2gSEIHjrPV8/BmXTtbi3mutvqrult/gvb3FluVcPqBwkMp6OtARc/Nz6EdxcBy2ep6j/+NjBa9O8GN4FXAbk+EtjoAZ4EXxKRVfBH+5xYre4BF4Kt7xuTmoVxcdFgEuyqA9F0EwhaTWyTY7XpebwWY5m55Nl9Rk3r4xnp8GSZq33fcooniwsoSBzC/TfeHmj/zyZb9w/MenXbYFqnIUt8uvPGDJylfNn3wdMBeBA0wu02X8uEy+rEU8OA67HUQYXaanWFdtubdkv7JGs4MT9+isEPD9uvL8/a+xTqcEq4tAciaLwyXNxqv88VWWDg8LttMnx/YHjsaz63Hjp1SQbayJeVGPohrjbLhdSOQGLGSY3tuSpZeD9Pb3b+G/GLgpOmTO01AAAAAASUVORK5CYII="
                                     class="img-fluid" alt="Sample image">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
