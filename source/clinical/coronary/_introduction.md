# Coronary Model #

##Introduction

Cardiovascular disease is the leading cause of death in the U.S., among which coronary artery disease is the deadliest, causing about 25% of total deaths. Coronary artery stenosis and occlusion is caused by plaque build up, often fatty materials resulting in atherosclerosis, in the arteries supplying blood to heart muscle resulting in ischemia. Severe coronary artery disease is often treated with coronary artery bypass graft surgery (CABG) where blood is redirected around blockages in the coronary arteries using a graft that is often taken from another part of the body. CABG is performed roughly 400,000 times a year in the U.S. alone. Another non-surgical treatment option is percutaneous coronary intervention (PCI), where a balloon catheter is inserted into the coronary lesion and inflated to open up the artery. PCI is performed roughly 500,000 times per year. Understanding blood flow may serve as the basis for understanding coronary artery disease progression and considering optimal therapeutic options for individual patients.

One key feature of coronary blood flow is the “out-of-phase” characteristic of flow and pressure. Unlike the systemic circulation where blood flow is the highest during systole, the majority of flow in the coronaries happens during diastole. This is due to the fact that the coronary vascular beds are constricted when the heart contracts during systole, elevating vascular resistance. When the heart relaxes during diastole, resistance is lower and coronary flow reaches its maximum. SimVascular has specialized boundary conditions that can model this behavior. The left coronary waveform is often characterized by low flow in systole followed by higher flow in diastole. The right coronary waveform is often characterized by roughly equal flow peaks in systole and diastole. An example of the two waveforms, with a scaled aortic pressure to demonstrate their out of phase behavior, is shown in Figure 1.

<figure>
  <img class="svImg svImgSm" src="clinical/coronary/imgs/sample_coronary_waveforms.png">
  <figcaption class="svCaption" >Figure 1: Characteristic coronary waveforms</figcaption>
</figure>

This tutorial is accompanied by a fully worked example of a coronary model and simulation. The rest of this tutorial will walk you through the steps in constructing a coronary model and running a simulation. It is recommended that new users first go through the general documentation to understand the workflow in SimVascular as this tutorial will focus on tips that are specifically useful for modeling coronaries, expecting users to have already gained a general familiarity with SimVascular. Instructions on where to refer to the main documentation will be provided through the course of this tutorial.
