% To start the program type this on the terminal ( with the dot '.') -> start.

start:-
	print_start,
	reset,!,
	findcareer(_).

print_start:- write("Hello , Welcome to career advising software for IIITD students"),nl,
  write('For each answer, write the number shown next to each option, followed by a dot (.)'), nl, nl.

reset:-
	retractall(progress(_,_)).
reset.


findcareer(_) :- 
	job(_);research(_);startup(_),!.
:- dynamic(progress/2).




%======
%JOBS
%=======

job(data_scientist):-(cst(csai);cst(cse);cst(csam)),chk(job,[job,startup,research]),chkf(ai,[ai,security,developing,networking]),chks(big_data,yes),asserta(progress(vk,vkk)),write("    \"You can do a job as a Data Scientist Engineer\""),nl,nl,chkmore(moreopt,no).

job(machine_learning_engineer):- (cst(csai);cst(cse);cst(csam)),chk(job,[job,startup,research]),chkf(ai,[ai,security,developing,networking]),chks(machine_learning,yes),write("    \"You can do a job as a Machine Learning Engineer\" "),nl.

job(web_development):- ( cst(csai);cst(cse);cst(csd);cst(csss);cst(csam)),chk(job,[job,startup2,research]),chkf(developing,[security,developing,networking]),chks( designHci,yes),write("    \"You can do a job as a Web/Mobile Developer\""),nl.
job(web_development):- ( cst(csb)),chk(job,[job,startup2,research]),chkf(developing,[developing,compb]),chks(designHci,yes),write("    \"You can do a job as a Web/Mobile Developer \" "),nl.
job(comp_biol):- ( cst(csb)),chk(job,[job,startup2,research]),chkf(compb,[developing,compb]),chks(combb,yes),chkcg2(X),X >7,write("    \"You can do a job as a Computational Biologist.\" "),nl.
job(comp_biol):- ( cst(csb)),chk(job,[job,startup2,research]),chkf(compb,[developing,compb]),chks(combb,yes),chkcg2(X),X =<7,write("    \"Your cgpa for Computational Biologist is less , You can do a job as a Biomedical Applications Engineer \""),nl.
job(embedded_systems):- cst(ece),chk(job,[job,startup2,research]),(chkf(embedded,[embedded,signalprocessing])->((chks(eld,yes),asserta(progress(vk,vkk)),write("    \"You can do a job as a Embedded Systems Design Engineer\" "),nl,nl,chkmore(moreopt,yes))->(\+progress(fi,signalprocessing),chks(sigp,yes),write("  \"   You can do a job as a Signal Processing Engineer\" "),nl,nl);write(" "));

((chkf(signalprocessing,[embedded,signalprocessing]))->(chks(sigp,yes),asserta(progress(vk,vkk)),write("   \"You can do a job as a Signal Processing Engineer \""),nl,chkmore(moreopt,yes))->(chks(eld,yes),write("   \"You can do a job as a Embedded Systems Design Engineer \""),nl,nl);write(" "));write(" ")).

job(information_Security_analyst):- (cst(csai);cst(cse);cst(csd);cst(csss);cst(csam)),chk(job,[job,startup2,research]),chkf(security,[security,developing,networking]),chks(focs,yes),asserta(progress(vk,vkk)),write("   \"You can do a job as a Information Security Analyst\""),nl,nl,chkmore(moreopt,no).
job(network_security):- (cst(csai);cst(cse);cst(csd);cst(csss);cst(csam)),chk(job,[job,startup2,research]),chkf(security,[security,developing,networking]),chks(nse,yes),write("   \"You can do a job as a Network Security Engineer \" "),nl.

job(networking_eng):-(cst(csai);cst(cse);cst(csd);cst(csss);cst(csam)),chk(job,[job,startup2,research]),chkf(networking,[security,developing,networking]),chks(sdn,yes),asserta(progress(vk,vkk)),write("   \"You can do a job as a Networking Engineer \" "),nl,nl,chkmore(moreopt,no).
job(wireless_eng):-(cst(csai);cst(cse);cst(csd);cst(csss);cst(csam)),chk(job,[job,startup2,research]),chkf(networking,[security,developing,networking]),chks(wn,yes),write("   \"You can do a job as a Wireless Networks Engineer \""),nl.

job(leave):-chk(job,[job,startup,research]),progress(vk,vkk),chkmore(moreopt,yes),write("Sorry you can't do this job then."),nl.

job(gap_year):-chk(job,[job,startup,research]),write("Sorry your Interests and Courses don't match , try again. "),nl.

%research

research(artificial):- (cst(csai);cst(cse)),chk(research,[job,startup,research]),chkf2(ai,[ai,hci,caos,teal]),chkp(A,'Artificial Intelligence'),gtd(A),chkcg(X),X >7,chkfin(yes),write("You should go for higher studies (MS or PhD) in Artificial Intelligence."),nl.
research(hci):-( cst(csai);cst(cse);cst(csd);cst(csss)),chk(research,[job,startup2,research]),chkf2(hci,[hci,caos]),chkp(A,'Human Computer Interaction'),gtd(A),chkcg(X),X >7,chkfin(yes),write("You should go for higher studies (MS or PhD) in Human Computer Interaction"),nl.
research(theory_Algo):-( cst(csai);cst(cse);cst(csam);cst(csb)),chk(research,[job,startup2,research]),chkf2(teal,[caos,teal]),chkp(A,'Theory and Algorithms'),gtd(A),chkcg(X),X >7,chkfin(yes),write(" You should go for higher studies (MS or PhD) in Theory and Algorithms"),nl.
research(vlsi):-cst(ece),chk(research,[job,startup2,research]),chkf2(vlsi,[caos,vlsi]),chkp(A,'Integrated Circuits and VLSI Design'),gtd(A),chkcg(X),X >7,chkfin(yes),write(" You should go for higher studies (MS or PhD) in Integrated Circuits and VLSI Design"),nl.
research(computer_aro):-( cst(csai);cst(cse);cst(csd);cst(csam);cst(csb);cst(ece);cst(csss)),chk(research,[job,startup2,research]),chkf2(caos,[caos]),chkp(A,'Computer Architecture and Organisation'),gtd(A),chkcg(X),X >7,chkfin(yes),write(" You should go for higher studies (MS or PhD) in Computer Architecture and Organisation"),nl.

research(none):-chk(research,[job,startup,research]), chkp(A,_),not(gtd(A)),write("Sorry you haven't done enough projects , do some more projects to go for higher education , or take a job .").
research(finales):-chk(research,[job,startup,research]),(chkfin(no)),write("Sorry ,it is not advisable for you to go for higher studies as of now ,take a job first."),nl.
research(lescgpa):-chk(research,[job,startup,research]),chkcg(X),X =< 7, write("Sorry your CGPA is not good enough to go for higher education in good institutes , try going for a job .").

%startup>

startup(intelligent_Systems):-(cst(csai);cst(cse);cst(csam)),chk(startup,[job,startup,research]),chkfin(yes),chkp(A,'Artificial Intelligence'),gtd(A),write("You should go for MBA , and try to do a Start Up in AI Systems."),nl.
startup(gen):-(cst(csai);cst(cse);cst(csd);cst(csss);cst(csam);cst(ece);cst(csb)),chk(startup2,[job,startup2,research]),chkfin(yes),chkp(A,'in total '),gtd(A),write("You should go for MBA , and try to do a Start Up."),nl.
startup(finales):-(chk(startup,[job,startup,research]);chk(startup2,[job,startup2,research])),(chkfin(no)),write("Sorry ,it is not advisable for you to try for a Start Up ,take a job first."),nl.
startup(lesproj):-(chk(startup,[job,startup,research]);chk(startup2,[job,startup2,research])), chkp(A,_),not(gtd(A)),write("Sorry you haven't done enough projects , do some more projects before doing a Start Up , or take a job").

gtd(A):- A >=2.

chkfin(Answer) :-
  progress(fina,Answer).
chkfin(Answer) :-
  \+ progress(fina, _),
  ask(fina, Answer, [yes,no]).

chkcg2(Answer) :-
  progress(cgpa2, Answer).
chkcg2(Answer) :-
  \+ progress(cgpa, _),
  ask(cgpa2, Answer, [10,9,8,7]).


chkcg(Answer) :-
  progress(cgpa, Answer).
chkcg(Answer) :-
  \+ progress(cgpa, _),
  ask(cgpa, Answer, [10,9,8,7]).

chkp(Answer,Ar) :-
  progress(projects, Answer).
chkp(Answer,Ar) :-
  \+ progress(projects, _),
  ask2(projects,Ar, Answer, [1,2,3]).

chkmore(Q,Answer) :-
  progress(Q, Answer).
chkmore(Q,Answer) :-
  \+ progress(Q, _),
  ask(Q, Answer, [yes,no]).

chks(Q,Answer) :-
  progress(Q, Answer).
chks(Q,Answer) :-
  \+ progress(Q, _),
  ask(Q, Answer, [yes,no]).

chkf2(Answer,Z) :-
  progress(fi, Answer).
chkf2(Answer,Z) :-
  \+ progress(fi, _),
  ask(fi, Answer, Z).

chkf(Answer,Z) :-
  progress(fi, Answer).
chkf(Answer,Z) :-
  \+ progress(fi,_),
  ask(fi, Answer, Z).

chkfece(Answer,Z) :-
  progress(fi, Answer).
chkfece(Answer,Z) :-
  \+ progress(fi,Answer),
  ask(fi, Answer, Z).




chk(Answer,Z) :-
  progress(field, Answer).
chk(Answer,Z) :-
  \+ progress(field, _),
  ask(field, Answer, Z ).

cst(Answer) :-
  progress(stream, Answer).
cst(Answer) :-
  \+ progress(stream, _),
  ask(stream, Answer, [csai,cse,ece,csam,csd,csss,csb]).
question(fina):-
	write("Do you think you can manage the financial aspect ?"),nl.
question(moreopt):-
	write("More Options ? "),nl.
question(eld):-
	write("Did you take a course in Embedded Logic Design ?"),nl.
question(sigp):-
	write("Did you take a course in Digital Signal Processing ?"),nl.	
question(focs):-
	write("Did you take a course in Foundations of Computer Security ?"),nl.
question(wn):-
	write("Did you take a course in Wireless Networks ? "),nl.
question(sdn):-
	write("Did you take a course in Software Defined Networking ? "),nl.
question(nse):-
	write("Did you take a course in Network Security ? "),nl.	
question(fi):-
	write("What field of area are you interested in ?"),nl.
question(cgpa2):-
	write("What is your CGPA in it ?"),nl.
question(cgpa):-
	write("What is your total CGPA ?"),nl.
question(machine_learning):-
	write("Did you take a course in Machine Learning  "),nl.
question(combb):-
	write("Did you take a course in  Algorithms for Computational Biology "),nl.
question(designHci):-
	write("Did you take a course in  Designing Human-Centered Systems"),nl.
question(big_data):-
	write("Did you take a course in Big data Analytics "),nl.
question(field):-
	write("What interests you the most ? "),nl.
question(stream) :-
  write("What is your Stream?"), nl.
question(projects,X):-
	write("How Many Projects have you done in "),write(X),write(" ? "),nl.
answer(vlsi):-
	write("Integrated Circuits and VLSI .").
answer(teal):-
	write("Theory and Algorithms .").
answer(hci):-
	write("Human Computer Interaction .").
answer(caos):-
	write("Computer Architecture and Organisation .").
answer(ai):-
	write("Artificial Intelligence.").
answer(security):-
	write("Systems Security.").
answer(developing):-
	write("Being a Developer.").
answer(compb):-
	write("Computational Biology").
answer(networking):-
	write("Networking anaysts.").


answer(job):-
	write("Solving problems, maintaining software etc. That is to say look for a job.").
answer(startup):-
	write("Creating new AI systems/ Working on ideas to create something new and useful,(i.e look forward for a startup).").
answer(startup2):-
	write("Creating Projects that help People,(i.e look forward for a startup).").
answer(research):-
	write("Studying / Anaylsing Theory.").



answer(10):-
	write(" 10 ").  
answer(9):-
	write(" 9 ").  
answer(8):-
	write(" 8 ").  
answer(7):-
	write(" 7 or less than 7 ").  
answer(1):-
	write(" 1 ").  
answer(2):-
	write(" 2 ").  
answer(3):-
	write(" 3 or more than 3  ").  
answer(yes):-
	write('Yes.').
answer(no):- 
	write("No.").
answer(csai):-
	write("CSAI .").
answer(cse):-
	write("CSE .").
answer(ece):-
	write("ECE .").
answer(csam):-
	write("CSAM .").
answer(csd):-
	write("CSD .").
answer(csss):-
	write("CSSS .").
answer(csb):-
	write("CSB .").





answer(embedded):-
	write(" Embedded Logic Design ").  
answer(signalprocessing):-
	write(" Signal Procssing ").  











% Parses an Index and returns a Response representing the "Indexth" element in
% Choices (the [First|Rest] list)
parse(1, [First|_], First).
parse(Index, [First|Rest], Response) :-
  Index > 1,
  NextIndex is Index - 1,
  parse(NextIndex, Rest, Response).

% Outputs a nicely formatted list of answers
% [First|Rest] is the Choices list, Index is the index of First in Choices
answers([], _).
answers([First|Rest], Index) :-
  write(Index), write('. '), answer(First), nl,
  NextIndex is Index + 1,
  answers(Rest, NextIndex).

% Asks the Question to the user and saves the Answer
ask(Question, Answer, Choices) :-
  question(Question),nl,
  answers(Choices, 1),
  read(Index),
  parse(Index, Choices, Response),
  asserta(progress(Question, Response)),nl,
  Response = Answer.
ask2(Question,X, Answer, Choices) :-
  question(Question,X),nl,
  answers(Choices, 1),
  read(Index),
  parse(Index, Choices, Response),
  asserta(progress(Question, Response)),nl,
  Response = Answer.
