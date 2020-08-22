import streamlit as st
import numpy as np
from PIL import Image
import cv2

def dodgeV2(x, y):
    return cv2.divide(x, 255 - y, scale=256)

def pencilsketch(inp_img):
    img_gray = cv2.cvtColor(inp_img, cv2.COLOR_BGR2GRAY)
    img_invert = cv2.bitwise_not(img_gray)
    img_smoothing = cv2.GaussianBlur(img_invert, (21, 21),sigmaX=0, sigmaY=0)
    final_img = dodgeV2(img_gray, img_smoothing)
    return(final_img)


st.title("PencilSketcher App")
st.write("This Web App is to help convert your photos to realistic Pencil Sketches")

file_image = st.sidebar.file_uploader("Upload your Photos", type=['jpeg','jpg','png'])

if file_image is None:
    st.write("You haven't uploaded any image file")

else:
    input_img = Image.open(file_image)
    final_sketch = pencilsketch(np.array(input_img))
    st.write("**Input Photo**")
    st.image(input_img, use_column_width=True)
    st.write("**Output Pencil Sketch**")
    st.image(final_sketch, use_column_width=True)
    if st.button("Download Sketch Images"):
        im_pil = Image.fromarray(final_sketch)
        im_pil.save('final_image.jpeg')
        st.write('Download completed')

st.write("Courtesy: 1littlecoder Youtube Channel - [Sketch Code](https://github.com/amrrs/youtube-r-snippets/blob/master/Create_a_Pencil_Sketch_Portrait_with_Python_OpenCV.ipynb)")

