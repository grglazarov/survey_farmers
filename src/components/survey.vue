<template>
    <div>
    <div v-if="step === 0" class = heatMap>
        <div style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;"> 
          <!-- border: 4px solid black;  -->
          <legend style="font-size: 100%;">
            <ul style="margin: 2px; padding: 10px">
              <li>Die Zuckerrübenproduktion ist mehr und mehr von Wirkstoffverlusten in Pflanzenschutzmitteln betroffen. Landwirtinnen und Landwirte brauchen Alternativen. Hier ist es oft hilfreich zu schauen, was BerufskollegInnen in der Region machen.</li>
              <br>
              <li>Wir von der Uni Bonn führen eine kurze (maximal 10 Minuten) Online-Umfrage zum Thema Unkrautbekämpfung in Zuckerrüben durch.  Ziel der Umfrage ist es, besser zu verstehen, welche Rolle der Austausch zwischen KollegInnen als Informationsquelle für Entscheidungen über neue Anbaupraktiken spielt.</li>
              <br>
              <li>Als LandwirtIn haben Sie online die Möglichkeit, anonym Angaben zu machen, wie Sie Unkraut bekämpfen. Hierbei interessieren wir uns nicht nur für LandwirtInnen die bereits Erfahrung mit mechanischer Unkrautbekämpfung haben. Für uns ist es ebenso wertvoll zu erfahren, warum LandwirtInnen diese Techniken nicht einsetzen oder ob sie planen, sie in Zukunft zu nutzen!</li>
              <br>
              <li>Sobald erste Befragungsergebnisse zu Verfügung stehen, können Sie hier auf einer Karte sehen, wo Landwirte schon an der Umfrage teilgenommen haben und vergleichen, welche Techniken zur Unkrautbekämpfung wo in Deutschland verwendet werden.</li>
              <br>
              <li><mark style="color: #1adee8; font-weight: normal; background: none; font-size: 120%"><i>Unter je 100 Teilnehmenden verlosen wir drei Gutscheine im Wert von 50 € für Engelbert Strauss.</i></mark></li>
            </ul>  
          </legend>
        </div>
         <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
           <h2 style="text-align: center">Karte</h2>
                   
         <section>
              <legend style="font-size: 100%;">
              <ul style="margin: 2px; padding: 10px">
                <li>Wählen Sie eine Unkrautbekämpfungsmethode um zu sehen, wie die Verteilung in Deutschland ist.</li>
                <li>Zur Orientierung sind die Zuckerrübenfabriken eingezeichnet.</li>
                <li>Die Daten werden aggregiert und sind so auch für andere Teilnehmer der Umfrage zu sehen. Es können keine Rückschlüsse auf individuelle Betriebe gezogen werden.</li>
              </ul>   
              </legend>
            <select class="bootstrap-select" style="width: 15em; border: 2px black solid"
              v-model="chosen_technique">             
              <option value="choose">Bitte auswählen</option>
              <option value="Alle Techniken">Alle Techniken</option>
              <option value="Striegel">Striegel</option>
              <option value="Hackstriegel">Hackstriegel</option>
              <option value="Reihenstriegel">Reihenstriegel</option>
              <option value="Rotorstriegel">Rotorstriegel</option>
              <option value="Scharhacke">Scharhacke</option>
              <option value="Trennhacke">Trennhacke</option>
              <option value="Rollhacke">Rollhacke</option>
              <option value="Fingerhacke">Fingerhacke</option>
              <option value="Kombination Hacke-Bandspritze">Kombination Hacke-Bandspritze</option>
              <option value="Häufelgerät">Häufelgerät</option>
              <option value="Hackbürste">Hackbürste</option>
              <option value="Hackfräse">Hackfräse</option>
            </select>
            </section>
        </div>
       <div style="border: 3px solid white">
      <keep-alive>
            <heatmapbox v-bind:heatmap-data="heatmap_coords" :selected-technique="chosen_technique">
            </heatmapbox>
      </keep-alive>
     </div>
     <br>
      <div style="padding: 5px; text-align: center">
    <button style="background-color: #182f4e;
                        color: white;
                        height:80px;
                        width:30%;
                        text-align: center;
                        font-size: 22px;"
                        @click="step+=1; scrollToTop()">zur Umfrage</button>
    </div>
   </div>
      
    <div v-if="step === 1" class = firstPage>
           <div>            
            <p v-if="step == 1 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>
            <section>
                    <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
                      <!-- border: 4px solid black; -->
                      <h2 style="text-align: center">Willkommen zu unserer Umfrage für Unkrautbekämpfung in Zuckerrüben!</h2>
                        <legend style="font-size: 100%;">
                        <ul style="margin: 2px; padding: 10px">
                        <li>Die Umfrage wird max. 10 Minuten in Anspruch nehmen.</li>
                        <li>Alle Ergebnisse werden anonymisiert analysiert. Wenn Sie möchten, senden wir Ihnen die zusammengefassten Ergebnisse der Studie zu. </li>
                        <li>Dazu können Sie im Anschluss an die Studie Ihre e-Mail Adresse angeben.</li>
                        <li>Zur Hilfe haben wir in der Umfrage Tipps hinterlegt, die Sie über das ?-Symbol aufrufen können.</li>
                        <li>Die in der Umfrage gewählte männliche Form bezieht sich zugleich auf weibliche, diverse und männliche Personen.</li>
                        <li>Bei Fragen wenden Sie sich bitte an:</li>
                        <p style="margin-top: 10px; padding: 0px">
                        <b>Anna Massfeller</b>
                        <br/>
                        
                        Doktorandin am Institut für Lebensmittel- und Ressourcenökonomik, Universität Bonn
                        <br />
                        E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de" style="color: #1adee8">anna.massfeller@ilr.uni-bonn.de</a> 
                       </p>
                       </ul>
                      </legend>
                   </div>
                   <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
                     <!-- border: 4px solid black; -->
                     <legend style="font-size: 110%;   text-align: center">
                        Um die Umfrage zu öffnen, akzeptieren Sie bitte unsere Datensicherheitserklärung.
                     </legend>
                     <div style="text-align: center">
                     <button style="text-align:center; font-size: 16px; height: 60px; width: 40%; font-weight: bold;" @click="popup = true">Datensicherheitserklärung</button>
                      <h4 style="font-size: 120%, font-weight: bold">Datenschutzerklärung Akzeptieren:<input
                      type="checkbox"
                      true-value="yes"
                      v-model="surveyData.question0.consent"
                      /></h4>
                    </div>
                  </div>
        <gdpr :show-popup = popup>
          <template v-slot:header>
            <h2 class="western" align="center" style="color:black">Einverständniserklärung in die Erhebung und Verarbeitung von Daten</h2>
          </template>
          <template v-slot:body>
          <div style=" color:white; margin:2px; padding:2px" lang="de-DE" >
                <p align="center" style="font-size: 12pt"><i>Durch</i></p>
                <br/>
                <p align="center" style="font-size: 12pt"><b>- Institut für Lebensmittel-
                und Ressourcenökonomik (ILR)</b> -</p>
                <p align="center"><i>Landwirtschaftliche
                Fakultät der Universität Bonn</i></p>
                <br/>
                <p style="margin-bottom: 0in; line-height: 108%">Für die Umfrage
                „Mechanische Unkrautbekämpfung in Zuckerrüben“ erfolgt die
                Erhebung und Verarbeitung folgender personenbezogener Daten:
                <ul>
                  <li>Alter</li>
                  <li>Angaben zum Betrieb</li>  
                  <li>E-Mail-Adresse (nur wenn Information zu den Ergebnissen der Umfrage gewünscht ist)</li>
                </ul></p>
                <p style="margin-bottom: 0in; text-align:justify; line-height: 108%">Die erhobenen Daten
                werden nicht an Dritte weitergegeben bzw. übermittelt und nur im
                internen Universitätsnetz (Server des ILR) gespeichert.</p>
                <p style="margin-bottom: 0in; text-align: justify; line-height: 108%">Die Daten werden bei
                dem Institut für Lebensmittel- und Ressourcenökonomik für die
                Dauer des Zwecks der Datenerhebung gespeichert und können nur von
                dazu berechtigten Personen eingesehen werden. Nach Wegfall des Zwecks
                werden die Daten gelöscht.</p>
                <p style="margin-bottom: 0in; line-height: 108%"><br/></p>
                <p style="margin-bottom: 0in; line-height: 108%"><font size="3" style="font-size: 12pt"><b>Nutzerrechte:</b></font></p>
                <p style="margin-bottom: 0in; text-align: justify; line-height: 108%">Die bzw. der
                Unterzeichnende hat das Recht, diese Einwilligung jederzeit ohne
                Angabe einer Begründung mit
                Wirkung für die Zukunft zu widerrufen. Weiterhin können die
                erhobenen Daten bei Bedarf korrigiert,
                gelöscht oder deren Erhebung eingeschränkt werden. Auf Anfrage kann
                unter der untenstehenden
                Adresse eine detaillierte Auskunft über den Umfang der vorgenommenen 
                Datenerhebung verlangt werden. Auch kann eine Datenübertragung angefordert 
                werden sollte die bzw. der
                Unterzeichnende eine Übertragung ihrer bzw. seiner Daten an eine
                dritte Stelle wünschen. Es kann bei Verstößen gegen den
                Datenschutz zudem Beschwerde bei der Aufsichtsbehörde erhoben werden.</p>
                <p style="margin-bottom: 0in; line-height: 108%"><br/></p>
                <p style="margin-bottom: 0in; line-height: 108%"><font size="3" style="font-size: 12pt"><b>Freiwilligkeit
                / Folgen des Nicht-Unterzeichnens:</b></font></p>

                <p style="margin-bottom: 0in;text-align: justify; line-height: 108%">Die Einwilligung zur
                Datenverarbeitung erfolgt freiwillig. Die bzw. der Unterzeichnende
                hat das Recht, dieser
                Einwilligungserklärung nicht zuzustimmen. Da für den o.g. Zweck die
                Erhebung und Verarbeitung der
                Daten erforderlich ist, können die entsprechenden Dienstleistungen
                in der Folge in diesem Fall nicht in Anspruch genommen werden.</p>
                <p style="margin-bottom: 0.11in; line-height: 108%"><br/></p>

                <font size="3" style="font-size: 12pt"><b>Zustimmung durch die
                betroffene Person:</b></font>
                <p style="margin-bottom: 0in; text-align: justify; line-height: 108%">Zur Verwendung,
                Speicherung und Nutzung meiner o.g. persönlichen Daten, erteile ich
                meine Einwilligung i.S.v.
                Art. 6 Abs. 1 lit. a) DS-GVO, die ich jederzeit ohne Angabe von
                Gründen mit Wirkung für die
                Zukunft widerrufen kann. Hiermit erkläre ich, über meine Rechte
                belehrt worden zu sein.</p>
                <br/>
                <p style="font-size: 12pt"><b>Kontakt:</b></p>
                <ul>
                  <li><p style="margin-bottom: 0in; line-height: 108%"><b>Beschwerden,
                  Auskunftsanfragen und andere Anliegen sind an folgende Stelle zu
                  richten:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%"><i>Anna Massfeller</i>
                  <br>Junior
                  Research Group of Hugo Storm “Data science in agricultural economics”
                  <br>Niebuhrstraße 1a, 53113 Bonn
                  <br>
                  E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de" style="color: #1adee8">anna.massfeller@ilr.uni-bonn.de</a></p>
                  </li>
                <li>
                  <p style="margin-bottom: 0in; line-height: 108%"><b>Zuständiger Datenschutzbeauftragter der Universität Bonn:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%"><i>Dr. Jörg Hartmann</i>
                  <br>
                  Genscherallee 3, 53113 Bonn
                  <br>
                  E-mail: <a href="mailto:joerg.hartmann@uni-bonn.de" style="color: #1adee8">joerg.hartmann@uni-bonn.de</a>
                  <br>
                  <a href="tel:+49228736758" style="color: #1adee8">+ 49 (0)228 -73 -6758</a>
                  <br> 
                  <a href="https://www.datenschutz.uni-bonn.de/" target="https://www.datenschutz.uni-bonn.de" style="color: #1adee8">https://www.datenschutz.uni-bonn.de</a></p>
                </li>
                <p style="margin-bottom: 0in; line-height: 108%"></p>
                <li>
                  <p style="margin-bottom: 0in; line-height: 108%"><b>Zuständige
                  Aufsichtsbehörde:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%"><i>Landesbeauftragte
                  für Datenschutz und Informationsfreiheit Nordrhein-Westfalen</i>
                  <br>Postfach 20 04 44, 40102 Düsseldorf</p>
                  <br>
              </li>
              </ul>
          </div>
      </template>

          <template v-slot:footer>
            <div class="d-flex align-items-center justify-content-between">
              <button class="btn btn--primary" @click="popup = false; surveyData.question0.consent = null ">Ablehnen</button>
              <button class="btn btn--primary" @click="popup = false; surveyData.question0.consent = 'yes'">Akzeptieren</button>
            </div>
          </template>
        </gdpr>
     </section> 
       <div style="text-align: center">            
         <button @click="step -=1; scrollToTop(); errors = []">Zurück</button>
         <button @click.prevent="next({consent: 'Datenschutzerklärung Akzeptieren'}, 'question0')" @click="scrollToTop()">Weiter</button>
          <br />
        </div>
        </div>

        <div v-if="step === 2">
            <h1>Frage {{ pageNumber }} / 8</h1>
            <div>
            <modal
             hideModal = true; helpText="Sie müssen diese Frage beantworten um fortfahren zu können.">
            </modal>
            </div>
            <br>  
           <div>            
            <p v-if="step == 2 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>
              <section>
                <legend for="question1">
                  Betreiben Sie mechanische Unkrautbekämpfung in Ihren Zuckerrüben? 
                  Dazu zählt auch chemisch-mechanisch kombinierte Unkrautbekämpfung wie eine Hacke-Bandspritze. 
                  Die Handhacke zählt in diesem Fall NICHT als mechanische Unkrautbekämpfung.
                
                </legend>
                <hr>
                <br />
                <input
                  type="radio"
                  value="1"
                  v-model="surveyData.question1.value"
                />
                <label for="one">Ja</label>
                <br />
                <input 
                type="radio" 
                value="0" 
                v-model="surveyData.question1.value" 
                />
                <label for="one">Nein</label>
                <br />
            </section>
            <br>
            <br>
        <div style="text-align: center">     
          <button @click.prevent="prev()" @click="scrollToTop(); errors = []">Zurück</button>
          <button @click.prevent="next({value: 'Frage 1'}, 'question1')" @click="scrollToTop()">Weiter</button>
           <br />  
         </div>       
        </div>

    <div v-if="step === 3 && surveyData.question1.value ==='0'">
          <h1>Frage {{ pageNumber }} / 8</h1>
          <modal 
          hideModal = true; helpText="Bitte geben Sie uns einige Hintergundinformationen zu Ihrer Entscheidung.">
          </modal>
          <br>
           <div>            
            <p v-if="step == 3 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>
          <div>
            <legend for="question2_alt"> 
              Warum nutzen Sie keine mechanische Unkrautbekämpfung? Wählen Sie alle passenden Gründe aus.Sie haben außerdem die Möglichkeit weitere Gründe oder Erklärungen im Kommentarfeld einzutragen.
            </legend>
              <hr>
              <br />
          </div>

          <input type="checkbox" name="pets" value="0" v-model="surveyData.question2_alt.select" > Zu hohe laufende Kosten<br>
          <input type="checkbox" name="pets" value="1" v-model="surveyData.question2_alt.select" > Zu hohe Investitionskosten<br>
          <input type="checkbox" name="pets" value="2" v-model="surveyData.question2_alt.select" > Zu hoher Zeitaufwand<br>
          <input type="checkbox" name="pets" value="3" v-model="surveyData.question2_alt.select" > Geringe Zuverlässigkeit in der Unkrautbekämpfung<br>
          <input type="checkbox" name="pets" value="4" v-model="surveyData.question2_alt.select" > Hohes Risiko die Kulturpflanze zu schädigen<br>
          <input type="checkbox" name="pets" value="5" v-model="surveyData.question2_alt.select" > Nicht möglich auf meinem Betrieb (z. Bsp. durch Bodenbedingungen, Feldgrößen, …)<br>
          <input type="checkbox" name="pets" value="6" v-model="surveyData.question2_alt.select" > Ich weiß nicht, ob die Technik bei mir funktioniert<br>         
          <input type="checkbox" name="pets" value="7" v-model="surveyData.question2_alt.select" > Ich traue mir die Anwendung/Bedienung nur bedingt zu<br>
          <input type="checkbox" name="pets" value="8" v-model="surveyData.question2_alt.select" > Meine Kollegen in der Region haben schlechte Erfahrungen gemacht und mir davon erzählt<br>
          <input type="checkbox" name="pets" value="9" v-model="surveyData.question2_alt.select" > Ich kenne keine Kollegen in meiner Region der mir Tipps geben könnten<br>
          <input type="checkbox" name="pets" value="10" v-model="surveyData.question2_alt.select" > Ich möchte noch warten bis die Technik ausgereifter ist<br>
          <input type="checkbox" name="pets" value="11" v-model="surveyData.question2_alt.select" > Es gibt für mich keinen Grund für eine Umstellung meines Anbaus<br>
          <br/>
          <div class="form-group">
            <label>Kommentar: </label>
            <textarea class="form-control"
                      style="width: 500px"
                      v-model="surveyData.question2_alt.comment"
                      placeholder="Kommentare hier einfügen"
                      required
                      id="question2_alt"
                      rows="3">
            </textarea>
          </div>
            <br>
            <br>
          <div style="text-align: center">            
          <button @click.prevent="prev()" @click="scrollToTop(); errors = []">Zurück</button>
          <button @click.prevent="next({select: 'Frage 2'}, 'question2_alt')" @click="scrollToTop()">Weiter</button>
            </div>
      </div>

    <div v-if="step === 3 && surveyData.question1.value ==='1'">
          <h1>Frage {{ pageNumber }} / 8</h1>
          <modal 
          hideModal = true; helpText="Bitte wählen Sie eine Maschine aus. Füllen Sie dann die entsprechenden Spalten in der Tabelle aus. 
                                      Sie können Maschinen hinzufügen, die nicht in der Liste stehen oder auch wieder entfernen.">
          </modal>
          <br>
           <div>            
            <p v-if="step == 3 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>
          <section>
            <legend for="question2"> 
              Seit wann nutzen Sie die folgenden Techniken? 
            </legend>
              <hr>
              <br />
              <br />
                <div style="width: 400px">   
                  <multiselect v-model="surveyData.question2.technique" 
                              :multiple="true"
                              :options="options"
                              :close-on-select="true"
                              :clear-on-select="false"
                              placeholder="Auswahl"  
                              selectLabel= "zum Auswählen anklicken"
                              selectedLabel="Ausgewählt" 
                              deselect-label="zum Entfernen anklicken" 
                              :preserve-search="false"
                              :max-height="300"
                              :searchable="false"
                              >
                    </multiselect> 
                </div>
          </section>
          <br/>
          <section>
             <label style="font-size: 14px"  for="question2_add">Andere Techniken, die nicht in der Liste stehen, können Sie hier hinzufügen:&nbsp;&nbsp;</label>
            <div style="display:flex; flex-direction: row; justify-content: left  ; align-items: center">
            <input id="question2_add"
                pattern=".{3,}"   
                required 
                type="text"
                v-model="surveyData.question2_add"
                placeholder="andere Technicken hier hinfügen"
                minlength="3">            
            <button @click="limitKeypress()">
            Hinzufügen
            </button>
            </div>
          </section>
          <br/>
          <table class="table table-success table-striped table-bordered" id="techniqueTable" 
          align="center" style="margin: 5px; padding: 8px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
            <thead>
              <tr>
                <th scope="col">Gerät</th>
                <th scope="col">Zusatzausstattung/ Investition/ Kommentare 
                  <i class="fa fa-question-circle" aria-hidden="true" 
                  data-toggle="tooltip" data-placement="bottom" 
                  title="Hat die Maschine eine besondere Ausstattung? Haben Sie das Gerät in der Vergangenheit durch ein neues ersetzt? Ist das Gerät autonom fahrend? Haben Sie vielleicht selbst etwas angebaut? Dann nutzen Sie bitte das Kommentarfeld."
                  style="font-size:22px;color:#87cefa">
                  </i>
                </th>
                 <th scope="col">Wem gehört die aktuell genutzte Maschine?</th>
              </tr>
            </thead>
            <tbody>
                <tr v-for="(method, index) in surveyData.question2.technique" :key="index">
                  <td>
                    <div style="display:flex; flex-direction: row; justify-content: left; align-items: center">
                    <label style="font-size: 20px"><b>{{method}}</b></label>
                    <button style="width:23px; height:23px" class="button close-icon" @click.prevent="deleteEntryTechnique(index)"/>
                    </div>
                    <hr>        
                    <div style="display:flex; flex-direction: row; justify-content: left; align-items: center">  
                        <label>Seit: &nbsp </label>
                      <input 
                      size="8"
                      placeholder="Jahr"                
                      type="number" 
                      max="2022" 
                      required
                      oninput="(validity.valid)||(this.value=''); this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                      v-model="surveyData.question2.timeframe[index]"
                      > 
                    </div>
                  </td> 
                 <td>
                    <div>
                      <div>
                        <input 
                        type="checkbox"
                        true-value= 1
                        false-value = 0
                        v-model="surveyData.question2.camera.choice[index]"
                        >
                        <label>a) Mit Kamera</label>
                      </div>
                        <div v-if="surveyData.question2.camera.choice[index] == 1" style="display:flex; flex-direction: row; justify-content: left; align-items: center">  
                        <label>Seit: &nbsp </label>
                          <input   
                            size="8"
                            placeholder="Jahr"               
                            type="number" 
                            required
                            max="2022" 
                            oninput="(validity.valid)||(this.value=''); this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                            v-model="surveyData.question2.camera.year[index]"
                        > 
                      </div>
                    </div>
                      <hr>
                    <div>
                      <div>
                        <input 
                        type="checkbox"
                        true-value= 1
                        false-value= 0
                        v-model="surveyData.question2.gps.choice[index]"
                        >
                        <label>b) Mit GPS</label>
                      </div>
                        <div v-if="surveyData.question2.gps.choice[index] == 1" style="display:flex; flex-direction: row; justify-content: left; align-items: center">  
                        <label>Seit: &nbsp </label>
                          <input 
                            size="8"
                            placeholder="Jahr"               
                            type="number" 
                            required
                            max="2022" 
                            oninput="(validity.valid)||(this.value=''); this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                            v-model="surveyData.question2.gps.year[index]"
                        > 
                      </div>
                    </div>
                      <hr>
                    <div>
                      <div>
                        <input 
                        type="checkbox"
                        true-value= 1
                        false-value = 0
                        v-model="surveyData.question2.newInvest.choice[index]"
                        >
                        <label>c) Neuinvestition</label>
                      </div>
                        <div v-if="surveyData.question2.newInvest.choice[index] == 1" style="display:flex; flex-direction: row; justify-content: left; align-items: center">  
                        <label>In: &nbsp </label>
                          <input 
                            size="8"
                            placeholder="Jahr"               
                            type="number" 
                            required
                            max="2022" 
                            oninput="(validity.valid)||(this.value=''); this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                            v-model="surveyData.question2.newInvest.year[index]"
                        > 
                      </div>
                    </div>
                      <hr>
                      <div>
                      <div>
                        <input 
                        type="checkbox"
                        true-value= 1
                        false-value = 0
                        v-model="surveyData.question2.autonom.choice[index]"
                        >
                        <label>d) Autonom fahrend</label>
                      </div>
                        <div v-if="surveyData.question2.autonom.choice[index] == 1" style="display:flex; flex-direction: row; justify-content: left; align-items: center">  
                        <label>Seit: &nbsp </label>
                          <input 
                            size="8"
                            placeholder="Jahr"               
                            type="number" 
                            required
                            max="2022" 
                            oninput="(validity.valid)||(this.value=''); this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                            v-model="surveyData.question2.autonom.year[index]"
                        > 
                      </div>
                    </div>                      
                      <hr>
                      <div>
                      <div>
                        <input 
                        type="checkbox"
                        true-value= 1
                        false-value = 0
                        v-model="surveyData.question2.comment.choice[index]"
                        >
                        <label>e) Kommentar </label>
                      </div>
                        <div v-if="surveyData.question2.comment.choice[index] == 1" style="display:flex; flex-direction: row; justify-content: left; align-items: center">  
                          <input style="height:30%; width: 70%"
                          type="text"
                          v-model="surveyData.question2.comment.text[index]"
                          placeholder="Hier einfügen"
                          required>
                      </div>
                    </div>  
                      <hr>
                       <div>
                      <input
                      id="one"
                      type="checkbox"
                      true-value= 1
                      false-value = 0
                      v-model="surveyData.question2.not_available[index]"
                      />
                      <label for="one">f) Keine Angabe</label>
                      </div>
                  </td>
                  <td>
                    <input
                      type="radio"
                      value = 0
                      v-model="surveyData.question2.machine[index]"
                      />
                      <label>Eigene Maschine</label>
                      <br />
                      <input 
                      type= "radio" 
                      value = 1
                      v-model="surveyData.question2.machine[index]" 
                      />
                      <label>Teile mit Nachbarn</label>
                      <br />
                      <input 
                      type="radio" 
                      value = 2
                      v-model="surveyData.question2.machine[index]" 
                      />
                      <label>Maschinenring</label>
                      <br />
                      <input 
                      type="radio" 
                      value = 3 
                      v-model="surveyData.question2.machine[index]" 
                      />
                      <label>Lohnunternehmer</label>
                      <br />
                      <input 
                      type="radio" 
                      value = 4 
                      v-model="surveyData.question2.machine[index]" 
                      />
                      <label>Andere </label>
                      <div v-if="surveyData.question2.machine[index] == 4" style="display:flex; flex-direction: row; justify-content: left; align-items: center">  
                          <input style="height:30%; width: 70%"
                          type="text"
                          placeholder="Hier einfügen"
                          required
                          v-model="surveyData.question2.other_machine[index]"
                          >
                      </div>                     
                </td>
              </tr>   
            </tbody>
          </table>
          <br>
          <br>
         <div style="text-align: center">            
          <button @click.prevent="deleteRowTechnique()">Alle löschen</button>
          <button @click.prevent="prev()" @click="scrollToTop(); errors = []">Zurück</button>
          <button @click.prevent="next()" @click="scrollToTop(); handleTable()">Weiter</button>
          </div>
        </div>

      
       <div v-if="step === 4">  
            <h1>Frage {{ pageNumber }} / 8</h1>
            <modal 
            hideModal = true; helpText="Hierbei sind nicht nur Zuckerrübenbauern gemeint. 
            Die Handhacke zählt in diesem Fall NICHT als mechanische Unkrautbekämpfung">
            </modal>
            <br>       
           <div>            
            <p v-if="step == 4 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div> 
            <section>
              <legend for="question3">
                  Mit wie vielen Landwirten, die mechanische oder chemisch-mechanisch kombinierte Unkrautbekämpfung <mark style="color: #1adee8; background: none">(nicht nur in Zuckerrüben!)</mark> einsetzen, stehen Sie in persönlichem Kontakt?
                  <br>
                  Hierbei sind nicht nur Landwirte gemeint, die man täglich spricht, sondern auch Landwirte mit denen Sie sich telefonisch oder zum Beispiel auf Messen, bei Arbeitskreistreffen, durch Anbauverbände und bei Feldbegehungen austauschen.
              </legend>
              <hr>
              <br />
                <input
                  type="radio"
                  value="0"
                  v-model="surveyData.question3.value"
                />
                <label for="one">0</label>
                <br />
                <input 
                type="radio" 
                value="1" 
                v-model="surveyData.question3.value" 
                />
                <label for="one">1-5</label>
                <br />
                <input 
                type="radio" 
                value="2" 
                v-model="surveyData.question3.value" 
                />
                <label for="one">6-10</label>
                <br />
                <input 
                type="radio" 
                value="3" 
                v-model="surveyData.question3.value" 
                />
                <label for="one">mehr als 10</label>
                <br />
            </section>
              <br>
            <div style="text-align: center">            
              <button @click.prevent="prev()" @click="scrollToTop(); errors = []">Zurück</button>
              <button @click.prevent="next({value: 'Frage 3'}, 'question3');" @click="setColor(); scrollToTop()">Weiter</button>      
            </div>
         </div>

      <div v-if="step === 5 || step === 6">
       <div v-if="step === 5 && skip_map == false">
          <h1>Frage {{ pageNumber }} / 8</h1>
            <modal 
              hideModal = true; helpText=" Bitte markieren Sie die entsprechende Lage auf der Karte. Sie können die Karte verschieben, 
              indem Sie die linke Maustaste gedrückt halten. Für unsere Auswertung ist eine möglichst präzise Angabe hilfreich. Sie können im Suchfeld oben rechts in der Ecke der Karte nach Orten suchen.">
           </modal>
           <br>    
           <div>            
            <p v-if="step == 5 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>
          <legend for="question4">
            Auf welchen Feldern haben Sie im letzten Wirtschaftsjahr (2021) Zuckerrüben angebaut? Bitte klicken Sie die entsprechenden Felder an bzw. setzen Sie den Marker.
            <br>
            <br>
            Um Ihnen die Auswahl zu erleichtern haben wir die Felder umrandet und jene gelb markiert, von denen wir wissen, dass dort in den letzten drei Wirtschaftsjahren (2019-2021) Zuckerrüben angebaut wurden. Sie haben außerdem die Möglichkeit auch nicht umrandete Flächen (gilt vor allem für Hamburg und das Saarland) mit Hilfe eines kleinen Traktor-Symbols zu markieren.
            <hr>
          </legend>
      </div>

      <div v-if="step === 5 && skip_map == true">
          <h1>Frage {{ pageNumber }} / 8</h1>
          <modal 
            hideModal = true; helpText="Diese Information wird anonym gespeichert und es können keine Rückschlüsse auf einzelne Betriebe gezogen werden. 
                                        Alle Daten werden später aggregiert und wie am Anfang auf der Karte zusammengefasst">
          </modal>
          <br> 
           <div>            
            <p v-if="step == 5 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>  
          <legend for="question4_alt">
               <br/>
               Bitte geben Sie Ihre Postleitzahl an: 
              </legend>
              <hr>
              <br />
              <div> 
                  <input  
                  minlength="5" 
                  maxlength="5"  
                  size="5"               
                  inputmode="numeric"                 
                  type="text" 
                  required
                  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                  v-model="surveyData.question4_alt.value" 
                  >
                </div>
                <br/>
                <br/>
             <div style="text-align: center">            
              <button @click.prevent="skip_map = false" @click="scrollToTop(); errors = []">Zurück</button>
              <button @click.prevent="next({value: 'Postleitzahl'}, 'question4_alt'); " @click="setColor(); scrollToTop()">Weiter</button>
          </div>
      </div>

      <div v-if="step === 6  && skip_map2 == false">
          <h1>Frage {{ pageNumber }} / 8</h1>
           <modal 
            hideModal = true; helpText="Bewegen Sie die Karte in dem Sie den linken Mauszeiger gedrückt halten.">
          </modal>
          <br>
           <div>            
            <p v-if="step == 6 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>         
          <legend>
            Welche Felder sind Ihnen bekannt (zum Beispiel durch Vorbeifahren), auf denen im letzten Wirtschaftsjahr (2021) mechanische oder chemisch-mechanisch kombiniert Unkrautbekämpfung angewandt wurde?
            <mark style="color: #1adee8; background: none">Hierbei sind nicht nur Zuckerrübenfelder gemeint!</mark> Bitte klicken Sie diese Felder auf der Karte an.
            <br>
            <br>          
            <b style="color: #FF7F50">&#10071 Bitte entfernen Sie die vorher angeklickten, orangefarbenen Felder / Marker nicht &#10071</b>
            <br>
            <hr>
          </legend>
      </div>

      <div v-if="step === 6 && skip_map2 == true">
      <h1>Frage {{ pageNumber }} / 8</h1>
      <modal 
      hideModal = true; helpText="Bitte geben Sie möglichst genau an, wo und wie viele Felder Sie zum Beispiel im Vorbeifahren beobachten.">
      </modal>
      <br>     
           <div>            
            <p v-if="step == 6 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>
      <section>
        <div style="margin: 0px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
          <legend>
           a) Wie viele Felder kennen Sie, auf denen Unkraut mechanisch oder chemisch-mechanisch kombiniert bekämpft wird?             
        </legend>
              <hr>
              <br>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="0" v-model="surveyData.question5_alt.fields">
              <label class="form-check-label">0</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="1" v-model="surveyData.question5_alt.fields">
              <label class="form-check-label">1-5</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="2" v-model="surveyData.question5_alt.fields">
              <label class="form-check-label">6-10</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="3" v-model="surveyData.question5_alt.fields">
              <label class="form-check-label">11-15</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="4" v-model="surveyData.question5_alt.fields">
              <label class="form-check-label">mehr als 15</label>
          </div>              
        </div>              
      </section>
        
      <section>
        <div style="margin: 0px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
        <legend for="question5_alt">
        b) In welchem Umkreis liegen diese Felder?
        </legend>
        <hr>
        <br>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="0" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">0-5 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="1" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">6-10 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="2" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">11-15 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="3" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">16-20 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="4" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">21-30 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="5" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">mehr als 30 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="6" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">Ich kenne keine Felder</label>
          </div>
        </div>
      </section>
      <br>
      <br>
      <div style="text-align: center">            
        <button @click.prevent="skip_map2 = false" @click="scrollToTop(); errors = []">Zurück</button>
        <button @click.prevent="next({fields: 'Frage 5 a)', distance: 'Frage 5 b)'}, 'question5_alt');" @click="scrollToTop(); popup = true">Weiter</button>
        </div>
    </div>   
        <div v-show="skip_map == false && skip_map2 == false" style="border: 3px solid white">
            <!-- Maps component embedding -->
            <keep-alive>
              <markermapbox v-bind:marked-farm="currentFarm" @map_clicked="setGeolocation"/>
            </keep-alive>
        </div>
            <div v-if="step === 5 && skip_map == false">
              <legend>
                <hr>
                <br>
                Aus der <a href="https://www.zi-daten.de/" target="_blank" rel="noopener noreferrer" style="color: #1adee8; background: none;">Invekos-Datenbank</a> haben wir die Daten in Form sogenannter shape-files für 
                <a href="https://www.opengeodata.nrw.de/produkte/umwelt_klima/bodennutzung/landwirtschaft/" target="_blank" rel="noopener noreferrer" style="color: #1adee8; background: none;">NRW</a>, 
                <a href="https://sla.niedersachsen.de/agrarfoerderung/schlaginfo/?#3172@9.43242/52.88125r0@EPSG:25832" target="_blank" rel="noopener noreferrer" style="color: #1adee8; background: none;">Niedersachsen</a> 
                und <a href="https://geoportal.brandenburg.de/detailansichtdienst/render?view=gdibb&url=https%3A%2F%2Fgeoportal.brandenburg.de%2Fgs-json%2Fxml%3Ffileid%3D996f8fd1-c662-4975-b680-3b611fcb5d1f" target="_blank" rel="noopener noreferrer" style="color: #1adee8; background: none;">Brandenburg</a> übernommen. 
                Diese Daten sind innerhalb der <a href="https://www.govdata.de/dl-de/zero-2-0" target="_blank" rel="noopener noreferrer" style="color: #1adee8; background: none;">Datenlizenz Deutschland</a> frei verfügbar, 
                wie im Rahmen der <a href="https://wiki.gdi-de.org/pages/viewpage.action?pageId=928219686" target="_blank" rel="noopener noreferrer" style="color: #1adee8; background: none;">EU INSPIRE</a> Richtlinie vorgegeben. 
                Die Daten für die anderen Bundesländer basieren auf Fernerkundungsdaten (automatisch erkannte Feldumrandungen aus eigenen Berechnungen basierend auf Satellitenbildern, diese stammen von <a href="https://www.copernicus.eu/en" target="_blank" rel="noopener noreferrer" style="color: #1adee8; background: none;">Copernicus</a>).
                <br>
                <br>                
                Abweichungen zwischen den Umrandungen der Felder und Ihren tatsächlichen Feldern sind möglich. Wählen Sie in diesem Fall einfach den/die am besten passendsten Schlag/ Schläge aus.
                Die Umrandung wird erst sichtbar, wenn sie näher auf der Karte heranzoomen. Für unsere Analysen sind Angaben zu den Feldern von großer Bedeutung, wenn Sie jedoch lieber keine Flächen anklicken möchten, 
                können Sie diese Frage auch überspringen und im nächsten Schritt alternative Ihre Postleitzahl angeben.
              </legend>    
              <hr>
             <div style="text-align: center">            
              <button @click.prevent="prev()" @click="scrollToTop(); errors = []">Zurück</button>
              <button @click.prevent="next()" @click="setColor(); scrollToTop()">Weiter</button>
              <button @click.prevent="skip_map = true" @click="surveyData.question4_5 = {farms: [], shapes: {'type': 'FeatureCollection', 'features': []}}; scrollToTop(); errors = []">Überspringen</button>
          </div>
        </div>
          <div v-if="step === 6  && skip_map2 == false">
            <legend>
              <hr>
              In unserer Analyse werten wir die Daten hinsichtlich der Distanzen zwischen eigenen und anderen Feldern aus. Es wird keine Auswertung individueller Betriebe oder Felder vorgenommen. Für uns ist es nur interessant wie die Felder anderer Landwirte, auf denen Sie mechanische Unkrautbekämpfung gesehen haben, räumlich verteilt sind, aber nicht, zu welchem Betrieb sie gehören.
              <br>
              <br>
              Wenn Sie die Felder nicht anklicken möchten oder nicht genau wissen, wo die Flächen liegen, können Sie diese Frage auch überspringen und im nächsten Schritt eine ungefähre Anzahl und Entfernung angeben.
            </legend>
            <hr>  
          <div style="text-align: center">            
          <button @click.prevent="prev()" @click="setColor(); scrollToTop(); errors = []">Zurück</button>
          <button @click.prevent="next()" @click="scrollToTop();">Weiter</button>
          <button @click.prevent="skip_map2 = true" @click="surveyData.question4_5 = {farms: [], shapes: {'type': 'FeatureCollection', 'features': []}}; scrollToTop(); errors = []">Überspringen</button> 
        </div>
      </div> 
  </div>

  <div v-show="step === 7">
    <gdpr :show-popup = popup>
        <template v-slot:header>
          <div style="text-align: center">
          <h2 class="western" style="color:black;">Fast fertig!</h2>
          </div>
        </template>
        <template v-slot:body>
            <div style=" color:white; height: 180px; font-size: 20px; margin:2px; padding:2px" lang="de-DE" >
                Sie haben den ersten Teil der Umfrage erfolgreich ausgefüllt und Ihre bisherigen Antworten wurden gespeichert. 
                <br>
                <br>
                Nun geht es weiter mit dem zweiten Teil.
            </div>
        </template>
        <template v-slot:footer>
          <div style="text-align: center">
            <button style="height:60px; width:30%;" class="btn btn--primary" @click="popup = false">Speichern und weiter</button>
          </div>
        </template>
    </gdpr>
  </div>

   <div v-if="step === 7">
        <h1>Frage {{ pageNumber }} / 8</h1>
            <modal 
            hideModal = true; helpText="Bitte wählen Sie für jede Technik (Beschrieben in der ersten Zeile) eine Option. Wenn Sie Ihren Betrieb in naher Zukunft an einen Nachfolger übergeben, wählen Sie einfach die Option, die Ihnen am wahrscheinlichsten erscheint.">
           </modal>
           <br>
           <div>            
            <p v-if="step == 7 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>  
          <section>
          <legend>
           Können Sie sich vorstellen in Zukunft mechanische Unkrautbekämpfung einzusetzen?
           <br>
          Bewerten Sie folgende Techniken im Hinblick auf die 5 Aussagen. Wählen Sie jeweils die Aussage/n, die am besten zu Ihrer derzeitigen Planung passt/passen.
        </legend>
        <hr>
        <br>
        </section>
          <div class="table-responsive">
            <table class="table table-hover">
              <thead style="background-color: #182f4e">
                <tr>
                  <th>Herkömmliche Maschinen zur mechanischen (z.B. Striegel, Hack) oder chemisch-mechanisch kombinierten (z.B. Hacke-Bandspritze) Unkrautbekämpfung (Ohne GPS/ Kamerasteuerung)</th>
                  <th>GPS- /kameragesteuerte, <b>gezogene</b> Maschinen zur mechanischen/ chemisch-mechanisch kombinierten Unkrautbekämpfung (nicht autonom fahrend)</th>
                  <th>GPS-/ kameragesteuerte <b>autonom</b> fahrende Maschinen zur mechanischen/ chemisch-mechanisch kombinierten Unkrautbekämpfung (z.Bsp. Roboter)</th>
                </tr>
              </thead>
              <tbody style="font-size:12px">
                <tr>
                  <td>
                    <label for="radio1"><input type="radio" value="0" v-model="surveyData.question6.column1" />Ich plane nichts in diese Richtung</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="1" v-model="surveyData.question6.column1" />Ich plane mich zu informieren und aktuelle Diskussionen und die Fachliteratur zu dem Thema zu verfolgen</label>  
                    <hr>
                    <label for="radio1"><input type="radio" value="2" v-model="surveyData.question6.column1" />Ich plane aktiv innerhalb der nächsten 5 Jahren Angebote einzuholen und Beratungsmöglichkeiten anzunehmen</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="3" v-model="surveyData.question6.column1" />Ich plane diese Technik innerhalb der nächsten 5 Jahren einzusetzen (Eigene Anschaffung, Lohnunternehmer, ...)</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="4" v-model="surveyData.question6.column1" />Ich setze diese Technik schon ein</label>
                  </td>
                  <td>
                    <label for="radio1"><input type="radio" value="0" v-model="surveyData.question6.column2" />Ich plane nichts in diese Richtung</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="1" v-model="surveyData.question6.column2" />Ich plane mich zu informieren und aktuelle Diskussionen und die Fachliteratur zu dem Thema zu verfolgen</label>  
                    <hr>
                    <label for="radio1"><input type="radio" value="2" v-model="surveyData.question6.column2" />Ich plane aktiv innerhalb der nächsten 5 Jahren Angebote einzuholen und Beratungsmöglichkeiten anzunehmen</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="3" v-model="surveyData.question6.column2" />Ich plane diese Technik innerhalb der nächsten 5 Jahren einzusetzen (Eigene Anschaffung, Lohnunternehmer, ...)</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="4" v-model="surveyData.question6.column2" />Ich setze diese Technik schon ein</label>
                  </td>
                  <td>
                    <label for="radio1"><input type="radio" value="0" v-model="surveyData.question6.column3" />Ich plane nichts in diese Richtung</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="1" v-model="surveyData.question6.column3" />Ich plane mich zu informieren und aktuelle Diskussionen und die Fachliteratur zu dem Thema zu verfolgen</label>  
                    <hr>
                    <label for="radio1"><input type="radio" value="2" v-model="surveyData.question6.column3" />Ich plane aktiv innerhalb der nächsten 5 Jahren Angebote einzuholen und Beratungsmöglichkeiten anzunehmen</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="3" v-model="surveyData.question6.column3" />Ich plane diese Technik innerhalb der nächsten 5 Jahren einzusetzen (Eigene Anschaffung, Lohnunternehmer, ...)</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="4" v-model="surveyData.question6.column3" />Ich setze diese Technik schon ein</label>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        <br>
        <br>
      <div style="text-align: center">            
      <!-- <button @click.prevent="prev()" @click="scrollToTop(); errors = []">Zurück</button> -->
      <button @click.prevent="next({column1: 'Spalte 1', column2: 'Spalte 2', column3: 'Spalte 3'}, 'question6')" @click="scrollToTop()">Weiter</button>
      </div>
  </div>
    
    <div v-if="step === 8">
        <h1>Frage {{ pageNumber }} / 8</h1>
        <modal 
        hideModal = true; helpText="Diese Daten dienen zur Erfassung der Repräsentativität unserer Umfrage und werden, wie die gesamte Umfrage, anonymisiert erfasst. Die Betriebsgröße bezieht sich auf die gesamte landwirtschaftlich genutzte Fläche (Eigen und Pacht).">
        </modal>
           <div>            
            <p v-if="step == 8 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>
        <h2 style="text-align: center">Persönliche und betriebliche Angaben</h2>     
        <section>
        <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
          <legend for="question7">
              a) Wie alt sind Sie?
          </legend>
              <hr>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="0" v-model="surveyData.question7.age">
              <label class="form-check-label">15-24</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="1" v-model="surveyData.question7.age">
              <label class="form-check-label">25-34</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="2" v-model="surveyData.question7.age">
              <label class="form-check-label">35–44</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="3" v-model="surveyData.question7.age">
              <label class="form-check-label">45-54</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="4" v-model="surveyData.question7.age">
              <label class="form-check-label">55-64</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="5" v-model="surveyData.question7.age">
              <label class="form-check-label">65 und mehr</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="6" v-model="surveyData.question7.age">
              <label class="form-check-label">keine Angabe</label>
          </div>
          </div>
        </section>

        <section>
          <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
          <legend for="question7">
              b) Wie groß ist Ihr Betrieb (in ha)?
          </legend>
          <hr>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="0" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">unter 5</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="1" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">5-9</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="2" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">10-19</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="3" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">20-49</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="4" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">50-99</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="5" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">100-199</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="6" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">200–499</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="7" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">500-999</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="8" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">1000 und mehr</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="9" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">keine Angabe</label>
          </div>
         </div>
        </section>
     
        <section>
          <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">        
          <legend for="question7">
            c) Wie bewirtschaften Sie Ihren Betrieb?
          </legend>
              <hr>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="0" v-model="surveyData.question7.farm">
              <label style="display:inline-block" class="form-check-label">konventionell</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="1" v-model="surveyData.question7.farm">
              <label style="display:inline-block" class="form-check-label">gesamter Betrieb ökologisch</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="2" v-model="surveyData.question7.farm">
              <label style="display:inline-block" class="form-check-label">Ackerbau ökologisch</label>
          </div>
           <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="3" v-model="surveyData.question7.farm">
              <label style="display:inline-block" class="form-check-label">andere Bereiche ökologisch</label>
          </div>
           <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="4" v-model="surveyData.question7.farm">
              <label style="display:inline-block" class="form-check-label">keine Angabe</label>
          </div>
        </div>
      </section>

        <section>
          <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
          <legend for="question7">
            d) Wie ist Ihr Betrieb ausgerichtet?<br>
          </legend>
              <hr>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="0" v-model="surveyData.question7.orientation">
                <label style="display:inline-block" class="form-check-label">Vornehmlich Ackerbau</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="1" v-model="surveyData.question7.orientation">
                <label style="display:inline-block" class="form-check-label">Vornehmlich Viehhaltung</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="2" v-model="surveyData.question7.orientation">
                <label style="display:inline-block" class="form-check-label">Vornehmlich Sonderkulturen</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="3" v-model="surveyData.question7.orientation">
            <label style="display:inline-block" class="form-check-label">Gemischtbetrieb</label>
          </div>
           <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="4" v-model="surveyData.question7.orientation">
              <label style="display:inline-block" class="form-check-label">keine Angabe</label>
          </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="5" v-model="surveyData.question7.orientation">
            <label style="display:inline-block" class="form-check-label">Andere/Kommentar</label>
          </div>
              <div v-if="surveyData.question7.orientation=='5'">  
            <textarea class="form-control"
                      style="width: 400px; height: 80px"
                      v-model="surveyData.question7.comment"
                      placeholder="Andere hier einfügen"
                      required
                      >
            </textarea>
            </div>
          </div>
        </section>

         <section>
          <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
          <legend for="question7">
            e) Nehmen Sie in der aktuellen Förderperiode (2021 - 2027) an einer Agrarumwelt-Klimamaßnahme (freiwillige Maßnahme aus 2. Säule der GAP) teil?
          </legend>
              <hr>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="0" v-model="surveyData.question7.environment">
                <label style="display:inline-block" class="form-check-label">Ja</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="1" v-model="surveyData.question7.environment">
            <label style="display:inline-block" class="form-check-label">Nein</label>
          </div>
           <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="2" v-model="surveyData.question7.environment">
              <label style="display:inline-block" class="form-check-label">keine Angabe</label>
          </div>
          </div>
        </section>
        <br>
        <br>
        <div style="text-align: center">            
        <button @click.prevent="prev()" @click="scrollToTop(); errors = []">Zurück</button>
        <button @click.prevent="next({age: 'a) Alter', size: 'b) Betriebsgröße (ha)', farm: 'c) Art der Bewirtschaftung', orientation: 'd) Betriebsausrichtung', environment: 'e) Teilnahme Agrarumwelt-Klimamaßnahme'}, 'question7')" @click="scrollToTop()">Weiter</button>
        </div>
    </div>

    <div v-if="step === 9">
        <h1>Frage {{ pageNumber }} / 8</h1>
        <modal 
        hideModal = true; helpText="Teilen Sie uns Ihre Gedanken zu dieser Umfrage und zum Thema mechanische Unkrautbekämpfung mit.">
        </modal>
        <br>        
        <section>
          <legend for="question8">
            Haben Sie Fragen oder Kommentare? Hier ist Platz dafür:
          </legend>
              <hr>
              <br />
          <div class="form-group">
            <textarea class="form-control"
                      style="width: 500px"
                      v-model="surveyData.question8.value"
                      placeholder="Fragen oder Kommentare hier hinfügen"
                      required
                      id="question8"
                      rows="3">
            </textarea>
          </div>
          <br />
        </section>
        <button @click.prevent="prev()" @click="scrollToTop(); errors = []">Zurück</button>
        <button @click="step+=1;scrollToTop()">Weiter</button>
    </div>
 
    <div v-if="step === 10">
      <h1>Ende</h1>
           <div>            
            <p v-if="step == 10 && errors && errors.length" style="padding: 5px; margin: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; text-align: center">
              <b>Um fortfahren zu können, müssen Sie alle erforderlichen Felder ausfüllen:</b>
              <ul  style="text-align: left">
                <li style="color: #e32c03" v-for="error in errors" :key="error">{{ error }}</li>
              </ul>
            </p>
           </div>
      <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
      <section>
        <legend>
            <p>
            Vielen Dank, dass Sie sich die Zeit genommen haben, an der Umfrage teilzunehmen.
            </p>
            <p>
            Sie haben nun die Möglichkeit bei unserem Gewinnspiel mitzumachen.
            Unter je 100 Teilnehmer/innen verlosen wir drei Gutscheine für Engelbert Strauss im Wert von 50 €.
            Dazu können Sie unten Ihre E-Mail-Adresse angeben. Diese wird getrennt von Ihren Angaben gespeichert und es kann keine Verbindung zu Ihren Antworten hergestellt werden.
            Sie werden dann lediglich über die Ergebnisse/ das Gewinnspiel informiert. Ansonsten erhalten Sie keine E-Mails von uns.
            </p>
            <p>
            Wenn Sie möchten, senden wir Ihnen auch die zusammengefassten Ergebnisse der Studie zu.
            </p>
        </legend>
      </section>
      </div>
       <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
      <section>
        <legend>
            Möchten Sie die zusammengefassten Ergebnisse der Studie per Mail erhalten?
        </legend>
        <input
          type="radio"
          value="1"
          v-model="surveyData.question9.value"
        />
        <label>Ja</label>
        <br />
        <input 
        type="radio" 
        value="0" 
        v-model="surveyData.question9.value" 
        />
        <label>Nein</label>
        <br />
      </section>
      <br />

      <section>
        <legend>
            Möchten Sie an dem Gewinnspiel teilnehmen?
        </legend>
          <input
            type="radio"
            value="1"
            v-model="surveyData.question10.value"
          />
          <label for="one">Ja</label>
          <br />
          <input 
          type="radio" 
          value="0" 
          v-model="surveyData.question10.value" 
          />
          <label for="one">Nein</label>
          <br />
          <br />
      </section> 
      </div>                     
        <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;" v-if="surveyData.question9.value=='1' || surveyData.question10.value=='1'">  
            <legend>
            Bitte geben Sie hier Ihre E-Mail-Adresse an. Diese Daten werden gesondert gespeichert und es besteht keine Verbindung zu Ihren Antworten in der Umfrage.
            </legend>           
            <br />
            <div class="mb-3">
                <label for="farmerEmail" class="form-label"><b>E-mail Adresse:</b></label>
                <input v-model="surveyData.farmerEmail.value" type="email" class="form-control" aria-describedby="emailHelp" id="farmerEmail" placeholder="mueller@gmx.de" required>
                <small id="emailHelp" class="form-text text-muted">Wir werden Ihre E-Mail-Adresse nicht an Dritte weitergeben.</small>
            </div>
        </div>
      <div style="margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px;">
      <legend>
          Bei Fragen melden Sie sich bitte bei:
          <br />
          <br />
          <i>Anna Massfeller, Doktorandin am Institut für Lebensmittel- und Ressourcenökonomik, Universität Bonn
          <br />
          E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de" style="color: #1adee8">anna.massfeller@ilr.uni-bonn.de</a>
          </i>
      </legend>
      </div>
  <button @click="step-=1; errors = []">Zurück</button>
  <button @click.prevent="next()" @click="scrollToTop();">Abgeben</button>
  </div>

    <div v-if="step === 'done'">
      <h1>Fertig!</h1>
      <p style="text-align: center">Vielen Dank für die Teilnahme an der Umfrage. Ihre Daten wurden nun gespeichert.</p>
      <br>
      <!-- {{ backendResponse }} -->
      <br>
    </div>

    <div v-if="step === 'error'">
      <h1>Oh, nein!</h1>
      <p style="text-align:center">Es ist etwas schiefgegangen. Entschuldigung für die Unannehmlichkeit!</p>
      <br>
      <button @click.prevent="step = 10">Erneut versuchen</button>
    </div>

      <!-- <br /><br />Debug: {{surveyData}} -->

    </div>
    </template>

<script>

import markermapbox from '@/components/markermapbox.vue'
import modal from './modal.vue'
import heatmapbox from './heatmapbox.vue'
import multiselect from 'vue-multiselect'
import gdpr from './gdpr.vue'
import dotenv from 'dotenv'

dotenv.config()

var PouchDB = require('pouchdb');
let pouchDb = PouchDB.default.defaults();
let db = new pouchDb(process.env.VUE_APP_DBKEY, {
  skip_setup: true
})
// whole db info: db.info().then(info => console.log(info));


export default {
    name: 'survey',
    components: {markermapbox, modal, heatmapbox, multiselect, gdpr},   
    watch: {
    surveyData: {
      deep: true,
      handler (prop) {
        if (prop.question2.technique) {
          // for each technology selected
          prop.question2.technique.forEach((name, i) => {
            // check if the timeframe and comment arrays
            // have a non-null value. If so -> replace with default
            if (!this.surveyData.question2.timeframe[i]) {
              this.surveyData.question2.timeframe[i] = false
            }
            if (!this.surveyData.question2.camera.choice[i]) {
              this.surveyData.question2.camera.choice[i] = 0
              this.surveyData.question2.camera.year[i] = false
            }
            if (!this.surveyData.question2.gps.choice[i]) {
              this.surveyData.question2.gps.choice[i] = 0
              this.surveyData.question2.gps.year[i] = false
            }
            if (!this.surveyData.question2.newInvest.choice[i]) {
              this.surveyData.question2.newInvest.choice[i] = 0
              this.surveyData.question2.newInvest.year[i] = false
            }
            if (!this.surveyData.question2.autonom.choice[i]) {
              this.surveyData.question2.autonom.choice[i] = 0
              this.surveyData.question2.autonom.year[i] = false
            }
            if (!this.surveyData.question2.comment.choice[i]) {
              this.surveyData.question2.comment.choice[i] = 0
              this.surveyData.question2.comment.text[i] = ''
            }   
            if (!this.surveyData.question2.not_available[i]) {
              this.surveyData.question2.not_available[i] = 0
            }     
            if (!this.surveyData.question2.machine[i]) {
              this.surveyData.question2.machine[i] = false
            }
            if (!this.surveyData.question2.other_machine[i]) {
              this.surveyData.question2.other_machine[i] = ''
            }                 
          })
        }
      }
    }
  },
  data () {
    return {
      step: 6,
      pageNumber: 0,
      errors: [],
      check: '',
      zip: null,
      popup: false,
      skip_map: false,
      skip_map2: false,
      zip_to_geo: {},
      selected: null,
      options: ['Striegel', 'Hackstriegel', 'Reihenstriegel', 'Rotorstriegel', 'Scharhacke', 'Trennhacke', 'Rollhacke', 'Fingerhacke', 'Kombination Hacke-Bandspritze', 'Häufelgerät', 'Hackbürste', 'Hackfräse'],
      heatmap_coords: [],
      chosen_technique: "choose",
      currentFarm: '',
      surveyData: {
        _id: new Date().toISOString(),
        question0: {consent: null},
        question1: {value: null},
        question2: {
          technique: [],
          timeframe: [],
          camera: {choice: [], year: []},
          gps: {choice: [], year: []},
          newInvest: {choice: [], year: []},
          autonom: {choice: [], year: []},
          comment: {choice: [], text: []},
          not_available:[],
          machine: [],
          other_machine: [],
        },
        question2_add: '',
        question2_alt: {select: [], comment: ''},
        question3: {value: null},
        question4_5: {farms: [], shapes: {"type": "FeatureCollection", "features": []}}, //here the farmer + neighbor coordinates are saved
        question4_alt: {value: ''},
        question5_alt: {
          distance: null,
          fields: null
        },
        question6: {column1: null, column2: null, column3: null},
        question7: {age: null, size: null, farm: null, orientation: null, environment: null, comment: ''},
        question8: {value: null},
        question9: {value: null},
        question10: {value: null},
        farmerEmail: {value: null},
      }
    }
  },
  methods: {

    //-- PouchDB methods

    setGeolocation: function(markers, plots) {

      this.surveyData.question4_5.farms = markers
      this.surveyData.question4_5.shapes = plots
    },

    getGeolocation: function() {
      var heatmap_data = []
      db.allDocs({
        include_docs: true,
        descending: true
      }).then(function(result) {
        var jsonData = result.rows
        for (var i = 0; i < jsonData.length; i++) {

          // *** insert the techniques ***
          
          var techniques = jsonData[i].doc.question2.technique
          heatmap_data.push({
            technique: techniques,
            coords: []
          })

          // *** insert the plot coordinates ***

          var plot_entries = jsonData[i].doc.question4_5.shapes.features
          for (var j = 0; j < plot_entries.length; j++) {
            if (plot_entries[j].properties.farm == 'own'){
              var plots = plot_entries[j].geometry.coordinates[0][0][0]
              var plots_coords = {'lng': plots[0], 'lat': plots[1]}
              heatmap_data[i].coords.push(plots_coords) 
            }
          }

          // *** insert the chosen farm coordinates ***

          var farm_entries = jsonData[i].doc.question4_5.farms
          for (var k = 0; k < farm_entries.length; k++) {

            if (farm_entries[k].own) {
              heatmap_data[i].coords.push(farm_entries[k].own)  
            }
  //          else if (farm_entries[k].others) {
  //            heatmap_data[i].coords.push(farm_entries[k].others)  
  //          }
          }
        }
      }).catch(function(err) {
        console.log("error" + err)
      })
      return heatmap_data
    },
    scrollToTop() {
      window.scrollTo(0,0)
    },
    validateEmail: function(email) 
    {
        var re = /\S+@\S+\.\S+/;
        return re.test(email);
    },
    limitKeypress: function() {    
    if (this.surveyData.question2_add.toString().length >= 3) {
          this.surveyData.question2.technique.push(this.surveyData.question2_add)
      }
    else this.surveyData.question2_add = ''
    },
    handleTable: function() {
    if (this.surveyData.question2.technique.length != 0)
    {
      this.surveyData.question6.column1 = "4"

      if (this.surveyData.question2.gps.choice.length != 0)
      {
          this.surveyData.question6.column2 = "4"
      }

      if (this.surveyData.question2.autonom.choice.length != 0)
      {
          this.surveyData.question6.column3 = "4"
      }
    }
    },
    setColor: function(){
      if (this.step === 5) {
          this.currentFarm = 'own'
      }
      if (this.step === 6) {
          this.currentFarm = "others"}
      },
    deleteEntryTechnique: function (index) {
      this.surveyData.question2.technique.splice(index, 1)
      this.surveyData.question2.timeframe.splice(index, 1)
      this.surveyData.question2.camera.choice.splice(index, 1)
      this.surveyData.question2.camera.year.splice(index, 1)
      this.surveyData.question2.gps.choice.splice(index, 1)
      this.surveyData.question2.gps.year.splice(index, 1)
      this.surveyData.question2.newInvest.choice.splice(index, 1)
      this.surveyData.question2.newInvest.year.splice(index, 1)
      this.surveyData.question2.autonom.choice.splice(index, 1)
      this.surveyData.question2.autonom.year.splice(index, 1)
      this.surveyData.question2.comment.choice.splice(index, 1)
      this.surveyData.question2.comment.text.splice(index, 1)
      this.surveyData.question2.machine.splice(index, 1)         
      this.surveyData.question2.not_available.splice(index, 1)
      this.surveyData.question2.other_machine.splice(index, 1)
    },
    deleteRowTechnique() {
      // delete row (index-0).

      this.surveyData.question2.technique = []
      this.surveyData.question2.timeframe = []
      this.surveyData.question2.camera = {choice: [], year: []}
      this.surveyData.question2.gps = {choice: [], year: []}
      this.surveyData.question2.newInvest = {choice: [], year: []}
      this.surveyData.question2.autonom = {choice: [], year: []}
      this.surveyData.question2.comment = {choice: [], text: []}
      this.surveyData.question2.not_available = []
      this.surveyData.question2.machine = []
      this.surveyData.question2.other_machine = []
      this.surveyData.question2_add = []
    },
    prev() {
      this.step-=1
      this.pageNumber-=1
    },
    next(formFieldsToCheck, questionNumber) {

    if (this.step == 3 && this.surveyData.question1.value == "1") {
          this.errors = []
          var q2 = this.surveyData.question2

          if (q2.technique.length > 0) {
            for (var l = 0; l < q2.technique.length; l++) {
                if (q2.timeframe[l] == false){
                  this.errors.push(
                  `${q2.technique[l]}: Spalte 1 - wählen Sie ein Jahr für die Technik`)
                }
                else if (q2.timeframe[l].toString().length != 4){
                  this.errors.push(
                    `${q2.technique[l]}: Spalte 1 - wählen Sie ein gültiges Jahr für die Technik`)               
                } 
                
                if (q2.camera.choice[l] == 1){
                    //pass;
                }
                else if (q2.gps.choice[l] == 1){
                    //pass;
                }
                else if (q2.newInvest.choice[l] == 1){
                    //pass;
                }
                else if (q2.autonom.choice[l] == 1){
                    //pass;
                }
                else if (q2.comment.choice[l] == 1){
                    //pass;
                }
                else if (q2.not_available[l] == 1){
                    //pass;
                }
                else {
                  this.errors.push(
                `${q2.technique[l]}: Spalte 2 - wählen Sie mindestens eine Option für die Technik`)
                }
                if (!q2.machine[l] == false) {
                    //pass;
                }
                else {
                  this.errors.push(
                      `${q2.technique[l]}: Spalte 3 - wählen Sie eine Option für die Technik`)
                } 
             }
          }
          else {
            this.errors.push(
                'Technik')
          }
      }

      else if (this.step == 5 && this.skip_map == true) {
          this.errors = []
          if (this.surveyData['question4_alt'].value.toString().length == 5)
          {
             //pass;
          }
          else {
            this.errors.push(
                'Bitte wählen Sie eine gültige 5-stellige Postleitzahl')
            } 
      }
      else if (this.step == 5 && this.skip_map == false) {
        this.errors = []
          if (!this.surveyData['question4_5'].farms.length == 0)
          {
              //pass;
            }
          else if (!this.surveyData['question4_5'].shapes.features.length == 0)
          {
              //pass;
        }
          else {
            this.errors.push(
                'Bitte wählen Sie ein oder mehrere Felder oder klicken Sie “Überspringen”')
            }  
        }
    
      else if (this.step == 6 && this.skip_map2 == false){
          this.errors = []
          this.check = ''
          var farm_length = this.surveyData['question4_5'].farms.length
          var shapes_length = this.surveyData['question4_5'].shapes.features.length

          if (!farm_length == 0){
            for (var i = 0; i < farm_length; i++) {
            if ('others' in this.surveyData['question4_5'].farms[i]){
                this.check = 'yes'
                break;
              }
              else {
                continue
              }
            }
          }
          if (!shapes_length == 0){
            for (var j = 0; j < shapes_length; j++) { 
            if (this.surveyData['question4_5'].shapes.features[j].properties.farm == 'others') {
              this.check = 'yes'
              break;
              }
              else {
                continue
              }
            }
          }
         if (this.check == 'yes'){
           this.popup = true
          }
          else {
              this.errors.push(
                'Bitte wählen Sie ein oder mehrere Felder oder klicken Sie “Überspringen”')
        }
      }
      else if (this.step == 10){
        this.errors = []
         if ((this.surveyData.question9.value == null) || (this.surveyData.question10.value == null)){
           this.errors.push(
                'Bitte geben Sie an, ob Sie die Ergebnisse per E-Mail erhalten und an dem Gewinnspiel teilnehmen möchten')
          } 
         else if ((this.validateEmail(this.surveyData.farmerEmail.value) == false && this.surveyData.question9.value == "1") || (this.validateEmail(this.surveyData.farmerEmail.value) == false && this.surveyData.question10.value == "1")) {
            this.errors.push(
                'Bitte geben Sie eine gültige E-mail-Adresse ein')
         } 
         else {
           this.submit()
         }
      }
      else {
        this.errors = []
        for (const field in formFieldsToCheck) {
          if (!this.surveyData[questionNumber][field] || !this.surveyData[questionNumber][field].length) {
            this.errors.push(
              `${formFieldsToCheck[field]}`
            )
          }
        }
      }
      if (!this.errors.length) {
        this.pageNumber+=1
        this.step+=1
        this.skip_map = false
        this.skip_map2 = false
      }
    },

    async postData(url = '', data = {}) {
      const response = await fetch(url, {
        method: 'POST',
        mode: 'cors',
        cache: 'no-cache',
        credentials: 'same-origin',
        headers: {
          'Content-Type': 'application/json'
        },
        redirect: 'follow',
        referrerPolicy: 'no-referrer',
        body: JSON.stringify(data)
      })
      return response.json()
    },
    async submit() {
      try {

        // send data to the backend, for testing use: "https://httpbin.org/post"

        this.backendResponse = await db.put(this.surveyData, function callback(err) {
          if (!err) {
            console.log('Feedback erfolgreich gepostet!');
          }
        })

        db.changes({
          since: 'now',
          live: true
        }) // .on('change', this.showDocs());

        console.log(this.backendResponse)
        this.step = 'done'
//      this.showDocs()
      } catch (e) {
        // ToDo: Handle errors
        console.error(e)
        this.step = 'error'
      }
    },
  },
  // calculates the heatmap on page load
  beforeMount() {
    this.heatmap_coords = this.getGeolocation()
  }
}
</script>   
<style scoped>

#techniqueTable {
  font-size: 14px;
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(255, 255, 255);
  border-collapse: collapse;
  width: 100%;
}

#techniqueTable td,
#techniqueTable th {
  margin: 5px; padding: 8px; border: 1px; border-style: solid; border-color: white; border-radius: 11px 11px 11px 11px; 

}

#techniqueTable tr:nth-child(even) {
  background-color:  #1f2f48;
}

#techniqueTable tr:nth-child(odd) {
  background-color:  #1f2f42;
}

#techniqueTable tr:hover {
  background-color: rgb(43, 61, 71);
}

#techniqueTable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #224470;
  color: white;
}

table,
th,
td {
   margin: 5px; padding: 5px; border: 1px; border-style: ridge; border-color: white; border-radius: 11px 11px 11px 11px; 
}


button {
  color: #000000;
  margin: 10px;
  border-radius: 5px;
  background-color: white;
  border: 1px solid #999;
  font-size: 14px;
  padding-right: 10px;
  padding-left: 10px;
  padding-top: 5px;
  padding-bottom: 5px;
  width: 120px;
  height: 45px;
  font-weight: bold;
}

button:hover {
background-color: #f0ebde;
}

h1 {
  text-align: center;
  display: block;
  font-size: 2em;
  margin-top: 0.67em;
  margin-bottom: 0.67em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
}

legend {
  font-weight: normal;
  text-align: justify;    
  hyphens: auto;
  font-family: Helvetica, Sans-Serif;
  font-size:120%; 
  color: #dbdbdb;
}

.multiselect {
  box-sizing: content-box;
  display: block;
  position: relative;
  width: 100%;
  min-height: 40px;
  text-align: left;
  color: #35495E;
}

.multiselect__tags {
  min-height: 40px;
  display: block;
  padding: 8px 40px 0 8px;
  border-radius: 5px;
  border: 1px solid #E8E8E8;
  background: rgb(46, 65, 88);
}

.multiselect__tag {
  position: relative;
  display: inline-block;
  padding: 4px 26px 4px 10px;
  border-radius: 5px;
  margin-right: 10px;
  color: #fff;
  line-height: 1;
  background: #5b6661;
  margin-bottom: 5px;
  white-space: nowrap;
  overflow: hidden;
  max-width: 100%;
  text-overflow: ellipsis;
}

.multiselect__tag-icon:after {
  content: "×";
  color: #216dcf;
  font-size: 14px;
}


.multiselect__content-wrapper {
  position: absolute;
  display: block;
  background: rgb(186, 185, 194);
  width: 100%;
  max-height: 240px;
  overflow: auto;
  border: 1px solid #E8E8E8;
  border-top: none;
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  z-index: 50;
  -webkit-overflow-scrolling: touch;
}

.multiselect__option--highlight {
  background: #5c615f;
  outline: none;
  color: white;
}

.multiselect__option--highlight:after {
  content: attr(data-select);
  background: #02113a;
  color: rgb(61, 66, 133);
}

.multiselect__option--selected {
  background: #F3F3F3;
  color: #35495E;
  font-weight: bold;
}

.multiselect__option--selected:after {
  content: attr(data-selected);
  color: silver;
}

.multiselect__option--selected.multiselect__option--highlight {
  background: #6a79ff;
  color: rgb(7, 15, 54);
}

.multiselect__option--selected.multiselect__option--highlight:after {
  background: #4d77ad;
  content: attr(data-deselect);
  color: rgb(49, 139, 190);
}

.multiselect__placeholder {
  display: inline-block !important;
  margin-bottom: 0px !important;
  padding-top: 0px !important;
}

.multiselect.invalid .multiselect__tags {
  border: 1px solid #f86c6b !important;
}

.multiselect__option--highlight {
  background: #405568 !important;
}

.multiselect__option--highlight:after {
  background: #233647 !important;
}

.multiselect__tags {
  padding: 5px !important;
  min-height: 10px;
}

.multiselect__placeholder {
  margin-left: 10px;
  margin-top: 2px;
}

.multiselect__tag {
  background: #f0f0f0 !important;
  border: 1px solid rgba(60, 60, 60, 0.26) !important;
  color: black !important;
  margin-bottom: 0px !important;
  margin-right: 5px !important;
}

.multiselect__tag-icon:after {
  color: rgba(60, 60, 60, 0.5) !important;
}

.multiselect__tag-icon:focus,
.multiselect__tag-icon:hover {
  background: #f0f0f0 !important;
}

.multiselect__tag-icon:focus:after,
.multiselect__tag-icon:hover:after {
  color: red !important;
}

* {
  box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  padding: 10px;
  height: 300px;
  /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

.close-icon {
  box-sizing: border-box;
  width: 20px;
  height: 20px;
  border-width: 3px;
  border-style: solid;
  border-color: red;
  background: -webkit-linear-gradient(-45deg, transparent 0%, transparent 46%, white 46%, white 56%, transparent 56%, transparent 100%), -webkit-linear-gradient(45deg, transparent 0%, transparent 46%, white 46%, white 56%, transparent 56%, transparent 100%);
  background-color: rgb(173, 132, 132);
  box-shadow: 0px 0px 5px 2px rgba(5, 5, 5, 0.5);
  transition: all 0.3s ease;
}


 @media only screen and (max-width: 800px) {

} 

</style>
/* word-wrap: break-word;   text-justify: distribute;   word-spacing:3px; /*

/* h1 {
  text-align: center;
  display: block;
  font-size: 3.4vw; 
  margin-top: 0.67em;
  margin-bottom: 0.67em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
}

legend {
  font-weight: normal;
  text-align: justify;
  word-wrap: break-word;
  text-justify: inter-word;
  text-justify: distribute;
  text-align-last: left;
  font-size: 2.3vw; 
  word-spacing:3px;
  color: #dbdbdb;
}
  button {
  width: 22%;
  height: auto;
  font-size: 2.5vw; 
  font-weight: bold;
} /*