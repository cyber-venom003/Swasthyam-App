# Swasthyam-Hackout
A flutter app for detecting the probablistic diseases in patients using Machine Learning. Made during Hackout 2020 

## Idea motivation and solution
The architecture of our healthcare ecosystem is divided into three layers:-
1. Patient going to doctor with symptoms and doctor recommending tests
2. Patient coming back with test results and doctor conforming disease
3. Doctor starting treatment

Our application will solve the first two layers and make healthcare system more fast and efficient.
We have done:-
1.) predicting disease from symptoms in our app
2.) recommending test for those diseases in app
3.) Developing AI based deep learning Algorithm for giving probability of having that disease
4.) integrating that DL algo in our app with Flask API framework

## Workflow Plan :beginner:

![Workflow Plan](/Swasthyam-Hackout.png)

## CheckList :white_check_mark:

- [x] Setup Basic Flutter Project
- [x] Implement functionality to get the diseases from symptoms.
- [x] Implement functionality to get recommended tests from diseases.
- [x] Using the deployed models in app to get disease probability from test results.

## Application Screenshots :iphone:

See on drive: https://drive.google.com/drive/folders/1bEFF8TWnppy2czvEJkfYR0PTtmu4yei3?usp=sharing

## Future Enhancements

Future things we will integrate here:-

- Personalized Chatbot based on NLP and vision to communicate with the users/Patient.
- BERT(Bidirectional encoder representations from transformers) and GPT based feature chatbots so patient can directly talk and symptoms can be auto recognized
- Medical report generation with the help GAN and BERT-text summarizer
- Adding Doctors contact and links so that those users can get a complete solution at a place
- Encoder-Decoder with Attention based language tranlation model to allow user communicate in every language

## Running project on your local machine

#### Flask Server
- Clone the project. Go to deployments folder.
- Place all the models by downloading from this link: https://drive.google.com/drive/folders/1qqBAw2re4kn7BPiz4lehwaLAXDz_MpO7?usp=sharing
- Open command line and type (FOR WINDOWS ONLY)
```
set FLASK_APP=modelDeployments.py
flask run --host(<Your-Local-IP>)
```
#### Flutter App
- Clone the project.
- Run following command
```
flutter pub get
```
- Replace the IP in routes/*.dart files with your local machine IP where Flask Server is running
- Start the application by following command
```
flutter run
```
