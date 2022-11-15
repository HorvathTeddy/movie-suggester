%Check if X is element of List
elem(X,[X|_]).
elem(X,[_|Tail]) :- elem(X,Tail).

%Check whether lists have a common element
elems(X,[Y|_]) :- elem(Y,X).
elems(X,[_|Tail]) :- elems(X,Tail).
   
list_movie(Producer,Ratings,Min,Max,Service,Genre, L) :-
    list_movie(Producer,Ratings,Min,Max,Service,Genre, [], L).

list_movie(Producer,Ratings,Min,Max,Service,Genre, Acc, L) :-
    movie(Movie,Producer,Rating,Length,Services,Genres),
    elems(Genre,Genres),
    elem(Service,Services),
    elem(Rating,Ratings),
    Length > Min-1,
    Length < Max+1,
    \+ elem(Movie, Acc), !,
    list_movie(Producer,Ratings,Min,Max,Service,Genre,[Movie|Acc], L). 

list_movie(_,_,_,_,_,_, L, L).

%Suggest movie to an user
suggest_movie(M) :- 
    write('Type your age: '),
    read(Age),
    get_rating(Age,Ratings),
    write('Choose your mood: \n   happy   sad   angry   scared\n'),
    read(Mood),
    write('Choose a producer from: 
    \n    kevin_feige   kathleen_kennedy   jerry_bruckheimer   frank_marshall   
    neal_moritz   steven_spielberg   christopher_nolan   charles_roven   
    david_heyman   avi_arad   laura_donner   janet_healy   
    francis_ford_coppola   quentin_tarantino   robert_zemeckis   brian_grazer   
    christopher_meledandri   james_cameron   jj_abrams   ian_bryce   
    todd_phillips   scott_rudin   lorenzo_di_bonaventura   jason_blum   
    simon_kinberg   peter_jackson   nancy_meyers   mark_osborne   
    kelly_asbury   clint_eastwood   nick_cassavetes   dawid_russell
    :\n'),
    read(Producer),
    write('Choose your serviceing platform: \n   netflix   hbogo   prime   disney:\n'),
    read(Service),
    write('Type minimum length of film in minutes: '),
    read(Min),
    write('Type maximum length of film in minutes: '),
    read(Max),
    get_genre(Mood,Genre),
    list_movie(Producer,Ratings,Min,Max,Service,Genre,M).
    

%Get ratings from user's age
get_rating(Age,X) :- Age < 7, X = [g].
get_rating(Age,X) :- Age > 6, Age < 13, X = [g,pg].
get_rating(Age,X) :- Age > 12, Age < 16, X = [g,pg,pg13].
get_rating(Age,X) :- Age > 15, Age < 18, X = [g,pg,pg13,r].
get_rating(Age,X) :- Age > 17, X = [g,pg,pg13,r,nc17].

%Get genres from user's mood
get_genre(Mood,X) :- 
    Mood = happy, 
    X = [horror,comedy,action,sci-fi,animation,fantasy,war,musical,romance,adventure,sci-fi].

get_genre(Mood,X) :-
    Mood = sad,
    X = [comedy,family,mystery,animation,fantasy,musical,space_opera,action,adventure,drama].

get_genre(Mood,X) :-
    Mood = scared,
    X = [family,fantasy,musical,comedy,space_opera,adventure,mystery,action,drama].

get_genre(Mood,X) :-
    Mood = angry,
    X = [comedy,family,sci-fi,animation,drama,musical,space_opera,drama,musical,fantasy,adventure,romance].

%DATABASE
movie(avengers_endgame,kevin_feige,pg13,122,[netflix],[action,fantasy,superhero,sci-fi,adventure]).
movie(the_fast_and_the_furious,neal_moritz,pg13,106,[netflix,prime],[thriller,adventure]).
movie(star_wars_the_force_awakens,kathleen_kennedy,pg13,136,[disney],[action,fantasy,space_opera,fantasy,sci-fi,adventure]).
movie(top_gun_maverick,jerry_bruckheimer,pg13,131,[hbogo],[action,adventure,fantasy,sci-fi]).
movie(pirates_of_the_caribbean_dead_mans_chest,jerry_bruckheimer,pg13,151,[hbogo],[action,adventure,comedy,fantasy]).
movie(jason_bourne,frank_marshall,pg13,123,[netflix],[action,thriller]).
movie(the_bourne_legacy,frank_marshall,pg13,135,[hbogo],[action,thriller,romance,mystery,adventure]).
movie(indiana_jones_and_the_raiders_of_the_lost_ark,steven_spielberg,pg,115,[prime],[action,adventure]).
movie(indiana_jones_and_the_last_crusade,steven_spielberg,pg13,127,[netflix,prime],[action,adventure]).
movie(indiana_jones_and_the_temple_of_doom,steven_spielberg,pg,118,[netflix,prime],[action,adventure]).
movie(star_wars_the_last_jedi,kathleen_kennedy,pg13,152,[disney],[action,sci-fi,space_opera,fantasy]).
movie(rogue_one_a_star_wars_story,kathleen_kennedy,pg13,133,[disney],[action,sci-fi,space_opera,adventure]).
movie(paddington,david_heyman,pg,95,[prime,netflix],[comedy,adventure,animation,comedy,fantasy]).
movie(wonka,david_heyman,pg13,123,[prime,netflix],[adventure,fantasy]).
movie(fantastic_beasts_the_crimes_of_grindelwald,david_heyman,pg13,134,[prime,netflix],[adventure,fantasy]).
movie(oppenheimer,charles_roven,pg13,150,[hbogo],[drama,romance]).
movie(interstellar,christopher_nolan,pg13,169,[netflix,disney],[adventure,drama,sci-fi]).
movie(tenet,christopher_nolan,pg13,150,[netflix,hbogo],[action,thriller,sci-fi]).
movie(dunkirk,christopher_nolan,pg13,106,[prime],[action,thriller,drama,war]).
movie(inception,christopher_nolan,pg13,148,[netflix],[action,adventure,sci-fi,thriller]).
movie(insomnia,christopher_nolan,r,118,[prime],[drama,mystery,thriller]).
movie(prestige,christopher_nolan,pg13,130,[hbogo],[drama,mystery,sci-fi]).
movie(the_amazing_spiderman,avi_arad,pg13,124,[netflix,prime],[drama,comedy,romance]).
movie(knives_out,laura_donner,pg13,136,[prime],[action,fantasy,drama,adventure]).
movie(deadpool,laura_donner,r,108,[disney],[action,fantasy,drama,adventure]).
movie(dead_phoenix,laura_donner,r,114,[netflix,hbogo],[action,fantasy,drama,adventure]).
movie(despicable_me,janet_healy,pg,95,[netflix],[family,comedy]).
movie(the_secret_life_of_pets,janet_healy,pg,90,[disney],[family,comedy]).
movie(minions_the_rise_of_gru,janet_healy,pg,90,[hbogo,prime],[adventure,comedy]).
movie(the_godfather,francis_ford_coppola,r,175,[hbogo],[drama,crime]).
movie(once_upon_a_time_in_hollywood,quentin_tarantino,r,161,[netflix],[drama,comedy]).
movie(kill_bill_vol_1,quentin_tarantino,r,146,[hbogo, prime],[adventure,action]).
movie(kill_bill_vol_2,quentin_tarantino,pg13,137,[netflix, prime],[action,adventure]).
movie(forrest_gump,robert_zemeckis,pg13,142,[netflix],[drama,romance]).
movie(inglourious_basterds,quentin_tarantino,r,153,[hbogo],[drama,action,war]).
movie(a_beautiful_mind,brian_grazer,pg13,135,[hbogo,prime],[drama]).
movie(the_grinch,christopher_meledandri,pg,115,[hbogo,disney],[family,comedy]).
movie(sing,christopher_meledandri,pg,110,[netflix,prime],[family,comedy]).
movie(titanic,james_cameron,pg13,194,[hbogo],[drama,romance]).
movie(avatar,james_cameron,pg13,162,[prime,netflix],[sci-fi,adventure]).
movie(terminator_genisys,james_cameron,pg13,126,[disney],[sci-fi,action]).
movie(star_trek_beyond,jj_abrams,pg13,122,[hbogo,prime],[action,sci-fi]).
movie(hard_rain,ian_bryce,r,97,[netflix],[action,thriller]).
movie(almost_famous,ian_bryce,r,122,[hbogo,prime],[comedy,drama]).
movie(transformers,ian_bryce,pg13,144,[disney],[action,sci-fi]).
movie(joker,todd_phillips,r,122,[netflix],[drama,crime]).
movie(war_dogs,todd_phillips,r,114,[hbgogo],[comedy]).
movie(the_hangover,todd_phillips,r,96,[prime],[comedy]).
movie(due_date,todd_phillips,r,95,[disney],[comedy]).
movie(the_grand_budapest_hotel,scott_rudin,r,100,[hbogo],[drama,comedy]).
movie(school_of_rock,scott_rudin,pg13,109,[netflix],[comedy]).
movie(clueless,scott_rudin,pg13,97,[prime],[comedy,romance]).
movie(orange_county,scott_rudin,pg13,87,[disney],[comedy]).
movie(snake_eyes,lorenzo_di_bonaventura,pg13,121,[hbogo],[action,adventure]).
movie(the_black_phone,jason_blum,r,102,[hbogo],[thriller,horror]).
movie(halloween_ends,jason_blum,r,111,[prime,netflix,disney],[thriller,horror]).
movie(the_martian,simon_kinberg,pg13,144,[netflix],[drama,sci-fi]).
movie(mr_and_mrs_smith,simon_kinberg,pg13,120,[hbogo,prime,disney],[action,romance]).
movie(the_lord_of_the_rings_the_fellowship_of_the_ring,peter_jackson,pg13,130,[hbogo],[drama,mystery,sci-fi]).
movie(the_hobbit_an_unexpected_journey,peter_jackson,pg13,155,[prime,netflix],[adventure,fantasy]).
movie(king_kong,peter_jackson,pg13,201,[disney],[adventure,fantasy]).
movie(the_intern,nancy_meyers,pg13,121,[netflix],[drama,comedy]).
movie(kung_fu_panda,mark_osborne,pg,92,[netflix],[animation,action,comedy,family]).
movie(spirit_stallion_of_the_cimarron,kelly_asbury,g,92,[netflix],[animation,drama]).
movie(the_cloverfield_paradox,jj_abrams,pg13,102,[netflix, disney],[sci-fi,thriller]).
movie(super_8,jj_abrams,pg13,112,[prime, netflix],[sci-fi,thriller]).
movie(the_dark_knight,christopher_nolan,pg13,152,[hbogo],[action,drama,crime]).
movie(gran_torino,clint_eastwood,r,116,[netflix],[drama]).
movie(american_sniper,clint_eastwood,r,132,[hbogo,prime],[drama]).
movie(sully,clint_eastwood,pg13,96,[disney],[drama]).
movie(saving_private_ryan,steven_spielberg,r,169,[netflix],[drama,war]).
movie(the_notebook,nick_cassavetes,pg13,123,[netflix],[drama,romance]).
movie(silver_linings_playbook,dawid_russell,r,122,[netflix],[comedy,drama,romance]).
movie(gi_joe_retaliation,lorenzo_di_bonaventura,pg13,110,[netflix],[action,adventure]).
movie(gi_joe_rise_of_cobra,lorenzo_di_bonaventura,pg13,118,[prime],[action,adventure]).
movie(transformers_the_last_knight,lorenzo_di_bonaventura,pg13,149,[disney],[action,sci-fi]).